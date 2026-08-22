{ config, pkgs, vars,... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ff = "fastfetch";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos#${vars.hostname}";
      nrb = "sudo nixos-rebuild dry-build --flake ~/nixos#${vars.hostname}";
      ls = "eza -l";
      void = "systemctl poweroff";
      # tmux
      tux = "tmux new-session -A -s tuxedo -c ~/tuxedo/ 'tuxedo'";
      nixos = "tmux new-session -A -s nixos -c ~/nixos/";
      aoc = "tmux new-session -A -s AdventOfCode -c ~/aoc/ 'nix develop'";
      devqs = "tmux new-session -A -s quickshell -c ~/.config/quickshell/dots-dev/";
    };
  };
}
