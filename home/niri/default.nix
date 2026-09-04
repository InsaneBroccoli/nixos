{ lib, osConfig, vars, ... }:

{
  config = lib.mkIf (osConfig.myConfig.desktop.compositor == "niri") {
    xdg.configFile."niri/" = {
      source = ./dots;
      recursive = true;
    };

    services.wpaperd = {
      enable = true;
      settings = {
        eDP-1 = {
          path = "/home/${vars.username}/nixos/pictures/wallpapers/alena-aenami-lights1k1.jpg";
        };
      };
    };
  };
}
