{ ... }:

{
  imports = [
    ./bootloader.nix
    ./editor.nix
    ./firewall.nix
    ./home.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./settings.nix
    ./sshd.nix
    ./swap.nix
    ./tailscale.nix
    ./unfree.nix
    ./user.nix
  ];
}
