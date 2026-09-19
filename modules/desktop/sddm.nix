{
  config,
  pkgs,
  inputs,
  ...
}:

{
  systemd.services.display-manager.environment = {
    XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
    XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "pixie";
    wayland.enable = true;

    # KDE/Qt6 build: fixes missing cursors and module errors.
    package = pkgs.kdePackages.sddm;

    extraPackages = [
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtdeclarative
      pkgs.kdePackages.qt5compat
    ];
  };

  environment.systemPackages = [
    # Unset fields fall back to theme defaults.
    (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
      avatar = ../../pictures/profile/cosmic-blackhole.jpg;
      accentColor = "#3F5F91";
      autoColor = true;
      backgroundColor = "#1A1C1E";
      textColor = "#E2E2E6";
      fontFamily = "JetBrains Mono"; # must be installed system-wide
    })
  ];
}
