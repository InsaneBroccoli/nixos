{
  lib,
  pkgs,
  osConfig,
  vars,
  ...
}:
{
  config = lib.mkIf osConfig.myConfig.desktop.enable {
    home.packages = [ pkgs.quickshell ];

    systemd.user.services.quickshell = {
      Unit = {
        Description = "Quickshell bar";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
        ConditionEnvironment = "WAYLAND_DISPLAY";
        # A fatal QML edit must not become an endless restart loop.
        StartLimitIntervalSec = 60;
        StartLimitBurst = 3;
      };
      Service = {
        # The package's mainProgram is `quickshell`; `qs` is the short alias.
        ExecStart = "${lib.getExe' pkgs.quickshell "qs"} -c dots";
        # on-failure, not always: `qs kill` during development must stick.
        Restart = "on-failure";
        RestartSec = "10";
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };

    xdg.configFile."quickshell/dots" = {
      source = ./dots;
      recursive = true;
    };

    xdg.configFile."quickshell/host-facts.json".text = builtins.toJSON {
      hasBattery = vars.hasBattery;
    };
  };
}
