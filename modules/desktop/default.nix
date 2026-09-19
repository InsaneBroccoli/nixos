{ lib, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./files.nix
    ./fonts.nix
    ./niri.nix
    ./printing.nix
    ./sddm.nix
  ];

  # Importing this directory is what makes a host a desktop.
  myConfig.desktop.enable = lib.mkDefault true;
}
