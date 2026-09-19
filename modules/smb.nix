{ config, vars, ... }:
let
  user = config.users.users.${vars.username};
  group = config.users.groups.${user.group};
in
{
  boot.supportedFilesystems.cifs = true;

  fileSystems."/mnt/nas" = {
    device = "//100.123.7.79/Synology";
    fsType = "cifs";
    options = [
      # automount
      "noauto"
      "x-systemd.automount"
      "x-systemd.requires=tailscaled.service"
      "x-systemd.after=tailscaled.service"
      "x-systemd.idle-timeout=600"
      "x-systemd.device-timeout=30s"
      "x-systemd.mount-timeout=30s"

      "credentials=/etc/nixos-smb/synologyPlay14"

      # nosuid/nodev are defense in depth — the share is nounix with forced
      # modes anyway. vers=3.1.1 is a deliberate floor: pre-auth integrity, no
      # silent downgrade. It does not encrypt; `seal` is unnecessary because
      # the transport is Tailscale. Applies to the next mount, so
      # `sudo umount /mnt/nas` (or wait for the idle timeout), then check
      # `findmnt /mnt/nas`.
      "nosuid"
      "nodev"
      "vers=3.1.1"

      # ownership mapping
      "uid=${toString user.uid}"
      "gid=${toString group.gid}"
      "file_mode=0644"
      "dir_mode=0755"
    ];
  };
}
