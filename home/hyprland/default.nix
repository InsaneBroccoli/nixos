{ config, pkgs, ... }:

{
  imports = [
    ./hyprpaper.nix
  ];

  xdg.configFile."hypr/" = {
    source = ./dots;
    recursive = true;
  };
}
