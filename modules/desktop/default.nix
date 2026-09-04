{lib, ... }:

{
  imports = [
    ./audio.nix
    ./hypr.nix
    ./niri.nix
    ./printing.nix
    ./sddm.nix
  ];

  options.myConfig.desktop.compositor = lib.mkOption {
    type = lib.types.enum [ "hyprland" "niri" ];
    default = "niri";
    example = "hyprland";
    description = ''
      Which Wayland compositor this host boots into.
    '';
  };
}
