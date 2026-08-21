{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/${vars.sshKeyName}";
        identitiesOnly = true;
      };
      # TODO: one block per non-tailnet host
    };
    extraConfig = ''
      AddKeysToAgent yes
      HashKnownHosts yes
    '';
  };
}
