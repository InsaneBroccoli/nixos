{ pkgs, ... }:
{
  programs.steam = {
    enable = true;

    # DECIDE: opens ports 27031-27036. Only if you actually stream.
    remotePlay.openFirewall = false;

    # DECIDE: GE-Proton. Genuinely useful, but add it after vanilla
    # Steam launches — otherwise you can't tell which layer broke.
    # extraCompatPackages = [ pkgs.proton-ge-bin ];

    # DECIDE: boots straight into Big Picture as a session. Console-ish.
    # gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;
}
