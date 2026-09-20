{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    bluetui
    brave-origin
    teams-for-linux
    vesktop
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
