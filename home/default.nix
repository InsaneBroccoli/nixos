{
  vars,
  ...
}:
{
  imports = [
    ./basic
    ./niri
    ./quickshell
    ./packages.nix
    ./nvim.nix
    ./tui.nix
    ./yazi.nix
  ];

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = vars.homeStateVersion;
  };

  # Enable Home Manager
  programs.home-manager.enable = true;
}
