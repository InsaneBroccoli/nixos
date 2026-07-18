{ config, pkgs, ... }:

{
  imports = [
    ./hyprpaper.nix
  ];

  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
}
