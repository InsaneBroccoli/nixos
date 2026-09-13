{ pkgs, vars, ... }:

{
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    brightnessctl
  ];

  # brightnessctl ships udev rules that let the `video` group write to
  # /sys/class/backlight; the brightness keys in home/niri/dots/binds.kdl
  # depend on this.
  services.udev.packages = [ pkgs.brightnessctl ];
  users.users.${vars.username}.extraGroups = [ "video" ];
}
