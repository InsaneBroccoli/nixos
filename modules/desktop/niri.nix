{ lib, config, pkgs, ... }:

{
  config = lib.mkIf (config.myConfig.desktop.compositor == "niri") {
    programs.niri.enable = true;
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
