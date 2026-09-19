{
  pkgs,
  config,
  vars,
  ...
}:

{
  imports = [
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

  # Laptop: keep rebuilds from starving the interactive session.
  nix.settings = {
    max-jobs = 2;
    cores = 4;
  };
  nix.daemonCPUSchedPolicy = "idle";
  nix.daemonIOSchedClass = "idle";

  system.stateVersion = "26.05";
}
