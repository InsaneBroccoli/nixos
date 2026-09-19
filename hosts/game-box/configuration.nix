{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../../modules/desktop
    ../../modules/smb.nix
    ../../modules/nvidia.nix
    ../../modules/steam.nix
    ../../modules/wootility.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages;

  # Always on AC and no TLP here, so nothing else manages the governor.
  powerManagement.cpuFreqGovernor = "performance";

  # NT sync primitives for Proton. Ships with 6.18 but nothing autoloads it;
  # games also need PROTON_USE_NTSYNC=1 in their launch options.
  boot.kernelModules = [ "ntsync" ];

  system.stateVersion = "26.05";
}
