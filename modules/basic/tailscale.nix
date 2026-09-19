{ ... }:

{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    # Records intent: both hosts only consume an exit node. Changes nothing
    # today (checkReversePath already defaults to "loose"); advertising
    # routes would need "server"/"both".
    useRoutingFeatures = "client";
  };
}
