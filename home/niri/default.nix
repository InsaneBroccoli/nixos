{ lib, osConfig, vars, ... }:

{
  config = lib.mkIf (osConfig.myConfig.desktop.compositor == "niri") {
    xdg.configFile."niri/" = {
      source = ./dots;
      recursive = true;
    };

    services.wpaperd = {
      enable = true;
      settings = {
        ${vars.monitor} = {
          path = ../../pictures/wallpapers/alena-aenami-lights1k1.jpg;
        };
      };
    };
  };
}
