# home/quickshell/default.nix — still needs the real values filled in
{ pkgs, vars, ... }:
{
  home.packages = [ pkgs.quickshell ];

  systemd.user.services.quickshell = {
    Unit = {
      Description = "Quickshell bar";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };
    Service = {
      ExecStart = "${pkgs.quickshell}/bin/qs -c dots";  # TODO: verify binary name
      Restart = "always";
      RestartSec = "10";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  xdg.configFile."quickshell/dots" = {
      source = ./dots;
      recursive = true;
  };

  xdg.configFile."quickshell/host-facts.json".text = builtins.toJSON {
    hasBattery = vars.hasBattery or false;
  };
}
