{ pkgs, lib, ... }:

{
  xdg.configFile."nvim/init.lua".enable = lib.mkForce false;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      tree-sitter
      clang-tools
      lua-language-server
      kdePackages.qtdeclarative
      nixd
      nixfmt
    ];
  };
}
