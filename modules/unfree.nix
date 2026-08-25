# modules/unfree.nix

{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
      "steam"
      "steam-unwrapped"
      "nvidia-kernel-modules"
      "wootility"
    ];
}
