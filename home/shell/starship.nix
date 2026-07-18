{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      line_break.disabled = true;

      package = {
        disabled = true;
      };
    };
  };
}
