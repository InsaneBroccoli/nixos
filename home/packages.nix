{ config, pkgs, lib, ...  }: 

{
  # List of packages to install for the user
  home.packages = with pkgs; [
      rofi
      thunar
      fastfetch
      brave
      teams-for-linux
      nerd-fonts.jetbrains-mono
      noto-fonts
      grim
      slurp
      udiskie
      quickshell
      thunderbird
      unzip
      zip
  ];

  fonts.fontconfig.enable = true;
}
