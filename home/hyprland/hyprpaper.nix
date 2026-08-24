{ config, pkgs, vars, ... }:

{
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
