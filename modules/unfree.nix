# modules/unfree.nix

{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg: builtins.elem (lib.getName pkg) [
      # TODO: add package names here, one per line, as strings.
      # Start EMPTY. Add nvidia + steam later, and only when a build
      # actually fails and tells you the name it wants.
    ];
}
