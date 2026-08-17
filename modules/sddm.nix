{ config, pkgs, inputs, ... }:

{
  systemd.services.display-manager.environment = {
    XKB_DEFAULT_LAYOUT = config.services.xserver.xkb.layout;
    XKB_DEFAULT_VARIANT = config.services.xserver.xkb.variant;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "pixie";
    wayland.enable = true; # Optional: for Wayland sessions

    # Crucial for Qt6: Use the KDE/Qt6 build of SDDM to fix missing
    # cursors and module errors.
    package = pkgs.kdePackages.sddm;

    # Required dependencies for Qt6 themes
    extraPackages = [
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtdeclarative
      pkgs.kdePackages.qt5compat
    ];
  };

  environment.systemPackages = [
    # Install and customize the theme. All fields are optional and will
    # fall back to theme defaults if not set.
    (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
      # background = ./my-background.jpg; # Nix path or absolute path
      # avatar = ./my-avatar.jpg;         # Nix path or absolute path
      accentColor = "#3F5F91";          # Hex color code
      autoColor = true;                 # true/false
      backgroundColor = "#1A1C1E";      # Hex color code
      textColor = "#E2E2E6";            # Hex color code
      fontFamily = "JetBrains Mono";    # Font family name (must be installed system-wide)
    })
  ];
}
