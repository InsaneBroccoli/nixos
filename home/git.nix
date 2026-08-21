{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "InsaneBroccoli";         
    userEmail = "aware_lucite0l@icloud.com";

    extraConfig = {
      init.defaultBranch = "main";  
      pull.rebase = true;
      core.editor = "vim";
    };

    aliases = {
      st = "status -sb";
      lg = "log --oneline --graph --decorate";
    };

    delta = {
      enable = true;   
      options = {
        navigate = true;
        line-numbers = true;
        # TODO: delta has a `side-by-side` option too — try it and see if
        # you prefer it over the default unified view before turning it on.
      };
    };
  };
}
