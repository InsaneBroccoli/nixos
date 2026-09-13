{ pkgs, ... }:

{
  # System-wide so pre-login consumers can see them; a user-profile font is
  # invisible to the sddm user. The Nerd Font exports the family
  # "JetBrainsMono Nerd Font"; the SDDM theme asks for "JetBrains Mono",
  # which only the plain package provides.
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
}
