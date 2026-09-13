{
  config,
  pkgs,
  lib,
  ...
}:

{
  # List of packages to install for the user
  home.packages = with pkgs; [
    bluetui
    brave-origin
    teams-for-linux
    grim
    slurp
    udiskie
    jq
    thunderbird
    unzip
    zip
  ];

  # Still needed: gtk.nix installs a font (Inter) into the user profile.
  fonts.fontconfig.enable = true;
}
