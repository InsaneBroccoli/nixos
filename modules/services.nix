{ pkgs, ... }:

{
  services.printing.enable = true;
  services.openssh.enable = true;
  services.displayManager.ly.enable = true;
}
