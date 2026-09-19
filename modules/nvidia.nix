{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true; # mandatory for Wayland

    # DECIDE: Turing is the oldest generation the open modules support and the
    # least exercised there; proprietary is better tested for this card.
    open = false;

    # DECIDE: stable / production / beta.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    nvidiaSettings = true;

    # Known flaky; add only when there is a suspend problem to solve.
    # powerManagement.enable = false;
  };
}
