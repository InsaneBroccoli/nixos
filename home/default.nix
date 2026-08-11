{ config, pkgs, lib, vars, ... }: 
{
  imports = [
    ./desktop-entries.nix
    ./gtk.nix
    ./packages.nix
    ./hyprland/default.nix
    ./shell/default.nix
    ./tex.nix
    ./tmux.nix
    ./tui.nix
    ./yazi.nix
  ];

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = "26.05";
  };
  
  # Enable Home Manager
  programs.home-manager.enable = true;
}
