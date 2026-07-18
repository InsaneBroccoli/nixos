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
}
