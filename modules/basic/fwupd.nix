{ ... }:

{
  # refresh metadata:  fwupdmgr refresh
  # list devices:      fwupdmgr get-devices
  # check updates:     fwupdmgr get-updates
  # apply updates:     fwupdmgr update  (BIOS/EC updates apply on next reboot)
  services.fwupd.enable = true;
}
