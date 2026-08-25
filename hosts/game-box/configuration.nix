{ config, pkgs, ... }:

{
  imports = 
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/common.nix
      ../../modules/nvidia.nix
      ../../modules/steam.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages;
  system.stateVersion = "26.05";
}

