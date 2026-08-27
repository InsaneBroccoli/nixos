{ ... }:

let
  # Nix string escapes are only \n \t \\ \" \${ — no \u, no \x.
  esc = builtins.fromJSON ''"\u001b"'';
  grey = "${esc}[90m";

  rule = s: { type = "custom"; format = "${grey}${s}"; };

  item = color: key: type: { inherit type key; keyColor = color; };
  hw = item "green";
  sw = item "yellow";
  de = item "blue";
  up = item "magenta";

  # Watch out: `${` inside a Nix string is interpolation. This script happens
  # to use only $(...) and $((...)) and bare $var, so it survives as-is. The
  # day you write ${HOME} in here, you must escape it as ''${HOME}.
  osAge = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
in
{
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        type = "builtin";
        height = 15;
        width = 30;
        padding = { top = 5; left = 3; };
      };

      modules = [
        "break"

        (rule "┌──────────────────────Hardware───────────────────────────┐")
        (hw "󰌢  PC"   "host")
        (hw "│ ├󰻠 " "cpu")
        (hw "│ ├󰍹 " "gpu")
        (hw "│ ├󰑭 " "memory")
        (hw "└ └󰋊 " "disk")
        (rule "└─────────────────────────────────────────────────────────┘")

        "break"

        (rule "┌──────────────────────Software───────────────────────────┐")
        (sw "  OS"    "os")
        (sw "│ ├󰌽 " "kernel")
        (sw "│ ├󰖡 " "bios")
        (sw "│ ├󰏗 " "packages")
        (sw "└ └󰞷 " "shell")

        "break"

        (de "󰧨  DE"   "de")
        (de "│ ├󰍁 " "lm")
        (de "│ ├󱂬 " "wm")
        (de "│ ├󰉦 " "wmtheme")
        (de "└ └󰆍 " "terminal")
        (rule "└─────────────────────────────────────────────────────────┘")

        "break"

        (rule "┌────────────────────Uptime / Age / DT────────────────────┐")
        ((up "  ›  OS Age  " "command") // { text = osAge; })
        (up "  ›  Uptime  " "uptime")
        (up "  ›  DateTime  " "datetime")
        (rule "└─────────────────────────────────────────────────────────┘")

        { type = "colors"; paddingLeft = 2; symbol = "circle"; }
      ];
    };
  };
}
