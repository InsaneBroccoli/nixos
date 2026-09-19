{ pkgs, vars, ... }:

{
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    brightnessctl
  ];

  # brightnessctl's udev rules let the `video` group write to
  # /sys/class/backlight; the brightness keys in home/niri/dots/binds.kdl
  # depend on it.
  services.udev.packages = [ pkgs.brightnessctl ];
  users.users.${vars.username}.extraGroups = [ "video" ];
}
