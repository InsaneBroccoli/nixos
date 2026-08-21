{ lib, pkgs, ... }:

let
  browser = lib.getExe pkgs.brave;
in 
{
  xdg.desktopEntries.whatsapp = {
    name = "Whatsapp";
    exec = "${browser} --app=https://web.whatsapp.com/";
  };

  xdg.desktopEntries.claude = {
    name = "Claude";
    exec = "${browser} --app=https://claude.ai/new";
  };

  xdg.desktopEntries.tailscale-admin-console = {
    name = "Tailscale Admin Console";
    exec = "${browser} --app=https://console.tailscale.com/admin/machines";
  };

  xdg.desktopEntries.youtube = {
    name = "YouTube";
    exec = "${browser} --app=https://www.youtube.com/";
  };

  xdg.desktopEntries.digitec = {
    name = "Digitec";
    exec = "${browser} --app=https://www.digitec.ch/en";
  };

  xdg.desktopEntries.github = {
    name = "GitHub";
    exec = "${browser} --app=https://github.com/";
  };
}
