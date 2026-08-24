{ config, pkgs, vars, ... }:

{
  home.packages = [pkgs.hyprpaper];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "../../pictures/wallpapers/alena-aenami-lights1k1.jpg";
      splash = false;
      wallpaper = {
        monitor = vars.monitor;
        path = "../../pictures/wallpapers/alena-aenami-lights1k1.jpg";
      };
    };
  };
}
