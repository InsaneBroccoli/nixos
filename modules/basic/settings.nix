{ ... }:

{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # trusted-users is deliberately left at the NixOS default (root only). A
  # trusted user can push unsigned store paths and add substituters, which is
  # root-equivalent. Rebuilds run as root via sudo, so nothing needs it.
  # Consequences: CLI `--option substituters/max-jobs/...` from the user are
  # silently ignored (tune via nix.settings instead), and a future
  # `nixos-rebuild --build-host` from another machine would need trust again.
}
