{ pkgs, ... }:

{
  # System-wide so pre-login consumers can see them; a user-profile font is
  # invisible to sddm. The Nerd Font exports "JetBrainsMono Nerd Font"; the
  # SDDM theme asks for "JetBrains Mono", which only the plain package has.
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
}
