{ lib, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./niri.nix
    ./printing.nix
    ./sddm.nix
  ];

  # Importing this directory is what makes a host a desktop. The option
  # itself is declared in modules/basic/desktop-option.nix so the home
  # layer can read it on every host.
  myConfig.desktop.enable = lib.mkDefault true;
}
