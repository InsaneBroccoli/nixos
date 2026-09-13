{ ... }:

{
  imports = [
    ./shell
    ./downloads-cleanup.nix
    ./git.nix
    ./ssh.nix
    ./tmux.nix
  ];
}
