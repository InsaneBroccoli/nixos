{ lib, ... }:

{
  # Declared in the always-on bundle so the home layer can read it on every
  # host, including ones that never import modules/desktop.
  options.myConfig.desktop.enable = lib.mkEnableOption "the niri compositor and the quickshell bar";
}
