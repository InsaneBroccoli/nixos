{
  config,
  lib,
  pkgs,
  osConfig,
  vars,
  ...
}:

let
  lock = "${lib.getExe config.programs.swaylock.package} -f";
in
{
  config = lib.mkIf osConfig.myConfig.desktop.enable {
    xdg.configFile."niri/" = {
      source = ./dots;
      recursive = true;
    };

    services.wpaperd = {
      enable = true;
      settings = {
        ${vars.monitor} = {
          path = ../../pictures/wallpapers/alena-aenami-lights1k1.jpg;
        };
      };
    };

    # Spawned from dots/binds.kdl; keep this list in sync with the binds.
    home.packages = [ pkgs.playerctl ];

    programs.fuzzel = {
      enable = true;
      settings.main = {
        # fuzzel appends the command, so the -e is required for ghostty.
        terminal = "ghostty -e";
        font = "JetBrainsMono Nerd Font:size=11";
      };
    };

    # Bound to Super+Alt+L in dots/binds.kdl and used by swayidle below.
    # The PAM service comes from NixOS: programs.niri pulls in
    # wayland-session.nix, which declares security.pam.services.swaylock.
    programs.swaylock = {
      enable = true;
      settings = {
        color = "2D2A2E"; # Theme.qml base
        ignore-empty-password = true;
        show-failed-attempts = true;
      };
    };

    # Lock before sleep and on `loginctl lock-session`; lock after 5 min
    # idle and blank the panel a minute later.
    services.swayidle = {
      enable = true;
      events = {
        before-sleep = lock;
        lock = lock;
      };
      timeouts = [
        {
          timeout = 300;
          command = lock;
        }
        {
          timeout = 360;
          command = "${lib.getExe pkgs.niri} msg action power-off-monitors";
        }
      ];
    };
  };
}
