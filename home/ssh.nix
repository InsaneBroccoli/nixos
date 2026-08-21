{ config, pkgs, vars, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        AddKeysToAgent = true;
        HashKnownHosts = true;
      };

      "github.com" = {
        identityFile = "~/.ssh/${vars.sshKeyName}";
        identitiesOnly = true;
      };
      # TODO: one block per non-tailnet host
    };
  };
}
