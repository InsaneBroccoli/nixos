{ lib, osConfig, config, pkgs, vars, ... }:

let
  wallpaper = ../../pictures/wallpapers/alena-aenami-lights1k1.jpg;
in
{
  config = lib.mkIf (osConfig.myConfig.desktop.compositor == "hyprland") {

  home.packages = [pkgs.hyprpaper];

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = "${wallpaper}";
        splash = false;
        wallpaper = {
          monitor = vars.monitor;
          path = "${wallpaper}";
        };
      };
    };
  };
}
