{ config, pkgs, ... }:

{
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/Pictures/wallpapers/alena-aenami-lights1k1.jpg";
      splash = false;
      wallpaper = {
        monitor="eDP-1";
        path="~/Pictures/wallpapers/alena-aenami-lights1k1.jpg";
      };
    };
  };
}
