{
  config,
  pkgs,
  vars,
  ...
}:
{
  networking.hostName = vars.hostname;
}
