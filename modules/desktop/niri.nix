{ pkgs, vars, ... }:

let
  # 0.8.2 regressed override-redirect focus, which kills Steam's top-bar menus.
  # Fixed by PR #494; drop this once a release past 0.8.2 lands in nixpkgs.
  xwayland-satellite = pkgs.xwayland-satellite.overrideAttrs (_: rec {
    version = "0.8.2-unstable-2026-09-09";
    src = pkgs.fetchFromGitHub {
      owner = "Supreeeme";
      repo = "xwayland-satellite";
      rev = "add2795134593faafce60e404a0a75df68e9ee0c";
      hash = "sha256-0TxfMgqW0/BLD4M942c5DCKYrtPvzsPJwvdcco4LQUM=";
    };
    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit src;
      hash = "sha256-s1gl9eR6Mt2QLrhfcowstPFjzwE/lz4PJhJzWYHoIHg=";
    };
  });
in
{
  programs.niri.enable = true;
  environment.systemPackages = [
    xwayland-satellite
    pkgs.brightnessctl
  ];

  # brightnessctl's udev rules let the `video` group write to
  # /sys/class/backlight; the brightness keys in home/niri/dots/binds.kdl
  # depend on it.
  services.udev.packages = [ pkgs.brightnessctl ];
  users.users.${vars.username}.extraGroups = [ "video" ];
}
