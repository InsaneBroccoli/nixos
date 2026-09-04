{ lib, osConfig, config, pkgs, vars, ... }:

{
  config = lib.mkIf (osConfig.myConfig.desktop.compositor == "hyprland") {

  home.packages = [pkgs.hyprpaper];

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = "~/nixos/pictures/wallpapers/alena-aenami-lights1k1.jpg";
        splash = false;
        wallpaper = {
          monitor = vars.monitor;
          path = "~/nixos/pictures/wallpapers/alena-aenami-lights1k1.jpg";
        };
      };
    };
  };
}
