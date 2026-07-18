{ ... }:

{
  imports = 
    [
      ./audio.nix
      ./bootloader.nix
      ./encryption.nix
      ./home.nix
      ./locale.nix
      ./network.nix
      ./packages.nix
      ./services.nix
      ./settings.nix
      ./swap.nix
      ./tailscale.nix
      ./tpl.nix
      ./user.nix
      ./variables.nix
    ];
}

