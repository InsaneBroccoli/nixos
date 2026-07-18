{ config, pkgs, ... }:

{
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/Pictures/wallpapers/wallpaper.webp";
      splash = false;
      wallpaper = {
        monitor="eDP-1";
        path="~/Pictures/wallpapers/wallpaper.webp";
      };
    };
  };
}
