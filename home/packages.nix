{ config, pkgs, lib, ...  }: 

{
  # List of packages to install for the user
  home.packages = with pkgs; [
      neovim
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
  ];

  fonts.fontconfig.enable = true;
}
