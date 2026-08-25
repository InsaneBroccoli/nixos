# PLACEHOLDER — this is not real hardware.
# Exists only so `nixos-rebuild dry-build --flake .#game-box` evaluates
# from another machine. nixos-generate-config overwrites it on install.

{ lib, ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-label/PLACEHOLDER-ROOT";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/PLACEHOLDER-ESP";
    fsType = "vfat";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
