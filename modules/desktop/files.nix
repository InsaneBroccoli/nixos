{ pkgs, ... }:

{
  # Thunar through its NixOS module rather than a bare package: gvfs gives
  # trash, MTP and network shares (and enables udisks2), tumbler gives
  # thumbnails. The module enables xfconf itself for Thunar's own settings.
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman
      thunar-archive-plugin
    ];
  };
  # The archive plugin only dispatches to an archive manager; xarchiver is
  # the one it ships a helper for.
  environment.systemPackages = [ pkgs.xarchiver ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
