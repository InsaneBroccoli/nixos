{ config, lib, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;   # mandatory for Wayland. not optional.

    # DECIDE: your 2080 Ti is Turing — the *oldest* generation the open
    # modules support, and the least exercised there.
    # Start false (proprietary, best-tested for this card).
    # Flipping to true later is a one-line experiment.
    open = false;

    # DECIDE: stable / production / beta.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    nvidiaSettings = true;

    # LEAVE OFF for now. Known flaky, and you'd never know whether a
    # suspend bug was this or something else. Add it when you have a
    # suspend problem to solve.
    # powerManagement.enable = false;
  };
}
