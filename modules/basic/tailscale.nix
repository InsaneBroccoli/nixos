{ ... }:

{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    # Both hosts only consume an exit node, never advertise routes. Today
    # this changes nothing (checkReversePath already defaults to "loose"),
    # it records the intent; advertising routes would need "server"/"both".
    useRoutingFeatures = "client";
  };
}
