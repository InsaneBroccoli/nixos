{ ... }:

{
  # enroll tpm2: sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=7 --tpm2-with-pin=yes /dev/<luks-partition>
  # wipe:        sudo systemd-cryptenroll --wipe-slot=tpm2
  boot.initrd.systemd.enable = true;
  boot.initrd.luks.devices."cryptroot".crypttabExtraOpts = [
    "tpm2-device=auto"
    "tpm2-pin=yes"
  ];
  boot.initrd.luks.devices."cryptroot".bypassWorkqueues = true;
}
