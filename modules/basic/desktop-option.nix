{ lib, ... }:

{
  # Declared here, in the always-on bundle, so the home layer can read
  # `osConfig.myConfig.desktop.enable` on every host — including headless
  # ones that never import `modules/desktop`. `modules/desktop` flips it on.
  options.myConfig.desktop.enable = lib.mkEnableOption "the niri compositor and the quickshell bar";
}
