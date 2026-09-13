# modules/basic/unfree.nix

{ lib, ... }:

{
  # Names are `lib.getName`, i.e. the pname. One entry per unfree package a
  # host actually installs; drop the entry when the consumer goes.
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11" # game-box: modules/nvidia.nix
      "nvidia-kernel-modules" # game-box: closed kernel modules (hardware.nvidia.open = false)
      "nvidia-settings" # game-box: modules/nvidia.nix
      "steam" # game-box: modules/steam.nix
      "steam-unwrapped" # game-box: modules/steam.nix
      "wootility" # game-box: hardware.wooting installs the Wootility app
      "claude-code" # think-pad: home/claude.nix
    ];
}
