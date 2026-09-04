{ lib, config, ... }:

{
  config = lib.mkIf (config.myConfig.desktop.compositor == "hyprland") {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
  };
}
