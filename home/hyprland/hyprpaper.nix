{ config, pkgs, vars, ... }:

{
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/Pictures/wallpapers/alena-aenami-lights1k1.jpg";
      splash = false;
      wallpaper = {
        monitor = vars.monitor;
        path = "~/Pictures/wallpapers/alena-aenami-lights1k1.jpg";
      };
    };
  };
}
