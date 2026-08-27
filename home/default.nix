{ config, pkgs, vars, ... }: 
{
  imports = [
    ./basic
    ./hyprland
    ./quickshell
    ./desktop-entries.nix
    ./ghostty.nix
    ./gtk.nix
    ./packages.nix
    ./nvim.nix
    ./tex.nix
    ./tui.nix
    ./yazi.nix
  ];

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = vars.homeStateVersion;
  };
  
  # Enable Home Manager
  programs.home-manager.enable = true;
}
