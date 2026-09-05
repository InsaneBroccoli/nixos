import Quickshell
import Quickshell.Io
import QtQuick

// ─────────────────────────────────────────────────────────────
// niri backend.
//
// Quickshell ships no Quickshell.Niri module, so this talks to
// niri's own IPC. `niri msg --json event-stream` prints one JSON
// object per line: first a full snapshot of the state, then
// deltas. Never poll — if you find yourself calling
// `niri msg workspaces` on a Timer, you have taken a wrong turn.
//
// Read one line of the raw stream before you touch this file:
//   niri msg --json event-stream | head -3 | jq
// ─────────────────────────────────────────────────────────────
QtObject {
    id: root

    property bool active: false

    // Raw niri Workspace objects, exactly as they come off the
    // wire:  { id, idx, name, output, is_urgent, is_active,
    //          is_focused, active_window_id }
    // Kept raw on purpose — translate at the edge (below), so the
    // day niri adds a field you only touch the mapping.
    property var rawWorkspaces: []

    // Raw niri Window objects, same treatment. Only `workspace_id`
    // is load-bearing here — it drives `occupied` — but the rest
    // rides along for whatever the bar wants next (urgency, counts).
    property var rawWindows: []

    // niri sends WindowsChanged one callback *after* the first
    // WorkspacesChanged, so for a frame `rawWindows` is empty while
    // `rawWorkspaces` is not. Until it lands, fall back to the
    // snapshot's own `active_window_id` (fresh at that instant) so
    // occupied workspaces don't flash the "empty" colour on startup.
    property bool windowsReady: false

    // ── the contract ──────────────────────────────────────────
    readonly property var workspaces: rawWorkspaces
        .slice()                          // never sort in place
        .sort((a, b) => a.output === b.output
                        ? a.idx - b.idx
                        : String(a.output).localeCompare(String(b.output)))
        .map(ws => ({
            // niri's socket resolves {"reference":{"Id":…}} against
            // the global workspace id, not the per-output idx.
            key:      ws.id,
            label:    ws.name ? ws.name : String(ws.idx),
            focused:  ws.is_focused === true,
            // "occupied" = at least one window lives here. Derived
            // from the window list, not ws.active_window_id: that
            // field only refreshes on a WorkspacesChanged snapshot,
            // which barely fires once the workspace set is fixed
            // (persistent workspaces in workspaces.kdl), so it rots
            // to its startup value and empty/occupied stops tracking.
            // The active_window_id branch is the startup-only bridge
            // described at `windowsReady`.
            occupied: root.windowsReady
                ? root.rawWindows.some(w => w.workspace_id === ws.id)
                : (ws.active_window_id !== null && ws.active_window_id !== undefined),
            output:   ws.output ?? ""
        }))

    // ── sending actions ───────────────────────────────────────
    // Won't redial if the connection dies — restart quickshell if
    // that ever happens. Not worth building reconnect logic for.
    // `connected` tracks desired state, not an established link, so
    // a click fired in the first moments after `active` flips true
    // (before the async connect lands) is dropped with a warning.
    // Not worth a pending-write queue — nobody clicks that fast.
    property Socket actionSocket: Socket {
        path: Quickshell.env("NIRI_SOCKET")
        connected: root.active
        onError: err => console.warn("niri: action socket error:", err)
        parser: SplitParser {
            onRead: line => {
                let reply;
                try {
                    reply = JSON.parse(line);
                } catch (e) {
                    console.warn("niri: unparseable action reply:", line);
                    return;
                }
                if (reply.Err)
                    console.warn("niri: action failed:", reply.Err);
            }
        }
    }

    function focusWorkspace(key) {
        if (!actionSocket.connected) {
            console.warn("niri: action socket not connected, dropping focus request");
            return;
        }
        actionSocket.write(JSON.stringify({
            Action: { FocusWorkspace: { reference: { Id: key } } }
        }) + "\n");
        actionSocket.flush();
    }

    // ── the event stream ──────────────────────────────────────
    property Process ipc: Process {
        running: root.active
        command: ["niri", "msg", "--json", "event-stream"]

        // SplitParser splits on "\n" by default: one call per event.
        stdout: SplitParser {
            onRead: line => root.handleEvent(line)
        }
    }

    function handleEvent(line) {
        if (!line)
            return;

        let ev;
        try {
            ev = JSON.parse(line);
        } catch (e) {
            console.warn("niri: unparseable event line:", line);
            return;
        }

        // niri serialises its Event enum as a single-key object,
        // e.g. {"WorkspaceActivated":{"id":3,"focused":true}}.
        if (ev.WorkspacesChanged) {
            // Full snapshot. Sent once at connect and again on any
            // structural change (workspace added/removed/moved).
            root.rawWorkspaces = ev.WorkspacesChanged.workspaces;

        } else if (ev.WorkspaceActivated) {
            const id = ev.WorkspaceActivated.id;
            const focused = ev.WorkspaceActivated.focused;

            const target = root.rawWorkspaces.find(w => w.id === id);
            if (!target)
                return;

            // QML only re-evaluates `workspaces` if the array
            // *identity* changes — mutating an element in place is
            // silently invisible. So rebuild.
            root.rawWorkspaces = root.rawWorkspaces.map(w => Object.assign({}, w, {
                // one active workspace per output
                is_active:  w.output === target.output ? (w.id === id) : w.is_active,
                // one focused workspace globally
                is_focused: focused ? (w.id === id) : w.is_focused
            }));

        } else if (ev.WindowsChanged) {
            // Full window snapshot, sent once just after the first
            // WorkspacesChanged.
            root.rawWindows = ev.WindowsChanged.windows;
            root.windowsReady = true;

        } else if (ev.WindowOpenedOrChanged) {
            // Upsert by id. Also fires on title/focus/layout changes,
            // not just workspace moves — each is a harmless rebuild
            // of a short list. filter-then-concat, never push, or the
            // `workspaces` binding won't see it (array identity).
            const win = ev.WindowOpenedOrChanged.window;
            root.rawWindows = root.rawWindows
                .filter(w => w.id !== win.id)
                .concat([win]);

        } else if (ev.WindowClosed) {
            const id = ev.WindowClosed.id;
            root.rawWindows = root.rawWindows.filter(w => w.id !== id);

        }
        // TODO(you): two more events are worth handling, in this
        // order of usefulness. Each is a few lines and follows the
        // rebuild-the-array pattern above:
        //
        //   WorkspaceUrgencyChanged      {id, urgent}
        //       -> add `urgent` to the contract in Wm.qml and a
        //          Theme.bar.wsUrgent colour, then use it in
        //          Workspaces.qml
        //   ConfigLoaded                 {failed}
        //       -> flash something in the bar when your niri config
        //          fails to reload; you will want this the first
        //          week you use niri.
        //
        // Unhandled events are simply ignored, so add them one at a
        // time and check with:  qs log  (or watch stderr).
    }
}
