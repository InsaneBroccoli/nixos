{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
    ripgrep
    tree
    wl-clipboard
    eza
  ];
}
