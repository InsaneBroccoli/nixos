{ config, ... }:

{
  imports = 
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/common.nix
      ../../modules/nvidia.nix
      ../../modules/steam.nix
    ];

  boot.kernelPackage = pkgs.linuxPackages_lts;
}

