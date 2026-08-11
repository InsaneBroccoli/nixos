{ config, vars, ... }:
let 
  user = config.users.users.${vars.username};
  group = config.users.groups.${user.group};
in {
  boot.supportedFilesystems.cifs = true;

  fileSystems."/mnt/nas" = {
    device = "//100.123.7.79/Synology";
    fsType = "cifs";
    options = [
      # --- automount behaviour ---
      "noauto"
      "x-systemd.automount"
      "x-systemd.requires=tailscaled.service"
      "x-systemd.after=tailscaled.service"
      "x-systemd.idle-timeout=600"
      "x-systemd.device-timeout=30s"
      "x-systemd.mount-timeout=30s"

      # --- credentials ---
      "credentials=/etc/nixos-smb/synologyPlay14"

      # --- ownership mapping ---
      "uid=${toString user.uid}"
      "gid=${toString group.gid}"
      "file_mode=0644"
      "dir_mode=0755"
    ];
  };
}
