{ lib, osConfig, ... }:

{
  imports = [
    ./hyprpaper.nix
  ];
  config = lib.mkIf (osConfig.myConfig.desktop.compositor == "hyprland")
  {
    xdg.configFile."hypr/" = {
      source = ./dots;
      recursive = true;
    };
  };
}
