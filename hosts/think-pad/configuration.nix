{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules
    ../../modules/desktop
    ../../modules/wifi.nix
    ../../modules/smb.nix
    ../../modules/encryption.nix
    ../../modules/tlp.nix
  ];

  # Raptor Lake iGPU: Mesa alone gives OpenGL/Vulkan, VA-API decode needs the
  # iHD driver (free). libva picks iHD first for i915, no LIBVA_DRIVER_NAME
  # needed. `enable` is set explicitly: it is otherwise only true through the
  # graphical-desktop module, and extraPackages is ignored when it is false.
  hardware.graphics = {
    enable = true;
    extraPackages = [ pkgs.intel-media-driver ];
  };
  environment.systemPackages = [ pkgs.libva-utils ]; # `vainfo` to verify

  # Consumes the firmware DPTF tables (INT3400) for managed thermal ramping
  # instead of the EC's blunt trip points. Complementary to TLP.
  services.thermald.enable = true;

  # hardware-configuration.nix sets no options for /, and nixpkgs appends
  # x-initrd.mount itself. Takes effect on switch via remount, no reboot.
  # Weekly fstrim is on, so no `discard` here.
  fileSystems."/".options = [ "noatime" ];

  # 14C/20T in a 28 W chassis: unbounded parallel builds saturate the power
  # limit and starve the desktop. 2x4 = 8 of 20 threads, and the daemon
  # yields CPU and I/O to interactive work.
  nix.settings = {
    max-jobs = 2;
    cores = 4;
  };
  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
