{ config, pkgs, ... }:
{
  nix.gc = {
    automatic = true;
    dates = "weekly"; 
    options = "--delete-older-than 7d"; 
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "dario" ];

  programs.nano.enable = false;
}
