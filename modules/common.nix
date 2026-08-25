{ ... }:

{
  imports = 
  [
    ./audio.nix  
    ./bootloader.nix
    ./editor.nix
    ./firewall.nix
    ./home.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./printing.nix
    ./sddm.nix
    ./settings.nix
    ./sshd.nix
    ./swap.nix
    ./tailscale.nix
    ./unfree.nix
    ./user.nix
  ];
}
