{ pkgs, ... }:
{
  programs.steam = {
    enable = true;

    # DECIDE: opens ports 27031-27036. Only if you actually stream.
    remotePlay.openFirewall = false;

    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.gamemode.enable = true;
}
