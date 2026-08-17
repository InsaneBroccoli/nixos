{ ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "de_CH.UTF-8";
    LC_PAPER = "de_CH.UTF-8";
    LC_MEASUREMENT = "de_CH.UTF-8";
    LC_MONETARY = "de_CH.UTF-8";
    LC_ADDRESS = "de_CH.UTF-8";
    LC_TELEPHONE = "de_CH.UTF-8";
    LC_NAME = "de_CH.UTF-8";
    LC_IDENTIFICATION = "de_CH.UTF-8";
  };

  services.xserver.xkb = {
      layout = "ch";
      variant = "de_nodeadkeys";
  };

  console.useXkbConfig = true;
  }
