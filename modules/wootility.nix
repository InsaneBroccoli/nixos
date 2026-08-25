{ vars, ... }:

{
  hardware.wooting.enable = true;

  # TODO 2: the udev rules grant device access through a group.
  #   Which group? (Read nixos/modules/hardware/wooting.nix — it's in the
  #   module description, not the code.)
  #
  #   Your user is defined in modules/user.nix. Do NOT go edit that file.
  #   NixOS merges list-typed options across every module that sets them,
  #   so you can extend extraGroups from right here — that keeps the
  #   Wooting concern in the Wooting file.
  #
  #   You'll need something from the function arguments to name the user.
  #   Look at how modules/user.nix does it, and fix the `{ ... }:` line above
  #   accordingly.
  #
  # users.users.${vars.username}.extraGroups = [ ... ];
}
