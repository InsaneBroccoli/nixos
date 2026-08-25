{ config, pkgs, vars, ... }: 
{
  imports = [
    ./hyprland/default.nix
    ./quickshell/default.nix
    ./shell/default.nix
    ./desktop-entries.nix
    ./git.nix
    ./gtk.nix
    ./packages.nix
    ./ssh.nix
    ./nvim.nix
    ./tex.nix
    ./tmux.nix
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
