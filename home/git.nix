# home/git.nix
{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "InsaneBroccoli";
        email = "aware_lucite0l@icloud.com";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";

      alias = {
        st = "status -sb";
        lg = "log --oneline --graph --decorate";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true; # no longer implicit — must be explicit now
    options = {
      navigate = true;
      line-numbers = true;
    };
  };
}
