{ ... }:

{
  imports = [
    ./bootloader.nix
    ./editor.nix
    ./firewall.nix
    ./fwupd.nix
    ./desktop-option.nix
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
