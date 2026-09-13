{
  pkgs,
  config,
  vars,
  ...
}:

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

  services.displayManager.autoLogin = {
    enable = true;
    user = vars.username;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = [ pkgs.intel-media-driver ];
  };
  environment.systemPackages = [ pkgs.libva-utils ]; # `vainfo` to verify

  services.thermald.enable = true;

  fileSystems."/".options = [ "noatime" ];

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
