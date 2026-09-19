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
  # trusted-users is deliberately left at the default (root only): a trusted
  # user can push unsigned paths and add substituters, which is root-
  # equivalent. Rebuilds run as root via sudo, so nothing needs it. Side
  # effect: CLI `--option substituters/max-jobs/...` are ignored, so tune via
  # nix.settings instead. Revisit if a remote `nixos-rebuild --build-host`
  # ever needs to push to this machine — that would need trust again.
}
