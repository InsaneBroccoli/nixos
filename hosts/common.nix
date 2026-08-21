{ ... }:

{
  imports = 
  [
    ../modules/audio.nix  
    ../modules/bootloader.nix
    ../modules/editor.nix
    ../modules/encryption.nix
    ../modules/home.nix
    ../modules/locale.nix
    ../modules/network.nix
    ../modules/packages.nix
    ../modules/printing.nix
    ../modules/sddm.nix
    ../modules/settings.nix
    ../modules/smb.nix
    ../modules/ssh.nix
    ../modules/swap.nix
    ../modules/tailscale.nix
    ../modules/user.nix
  ];
}
