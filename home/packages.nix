{ config, pkgs, lib, ...  }: 

{
  # List of packages to install for the user
  home.packages = with pkgs; [
      rofi
      thunar
      fastfetch
      brave-origin
      teams-for-linux
      nerd-fonts.jetbrains-mono
      noto-fonts
      grim
      slurp
      udiskie
      jq
      thunderbird
      unzip
      zip
  ];

  fonts.fontconfig.enable = true;
}
