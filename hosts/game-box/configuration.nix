{ config, pkgs, ... }:

{
  imports = 
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules
      ../../modules/desktop/
      ../../modules/smb.nix
      ../../modules/nvidia.nix
      ../../modules/steam.nix
      ../../modules/wootility.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages;
  system.stateVersion = "26.05";
}

