{ vars, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = !(vars.hasBattery or false);
    settings.General = {
      Experimental = true;
    };
  };
}
