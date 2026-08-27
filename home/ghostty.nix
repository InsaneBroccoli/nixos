{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "Monokai Pro";
      font-size = 10;
      window-decoration = false;
    };
  };
}


