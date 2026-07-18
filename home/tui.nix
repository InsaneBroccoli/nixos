{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    lazygit
    impala
    btop
    tuxedo
  ];
}
