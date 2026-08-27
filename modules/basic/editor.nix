{ config, ... }:

{
  environment.variables.EDITOR = "vim";
  programs.nano.enable = false;
}
