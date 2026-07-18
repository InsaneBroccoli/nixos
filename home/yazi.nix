{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override {
      extraPackages = with pkgs; [
        ffmpeg
        jq
        poppler
        fd
        ripgrep
        fzf
        zoxide
        resvg
        wl-clipboard
      ];
    };
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {
      mgr.show_hidden = true;
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
    plugins = {
      inherit (pkgs.yaziPlugins) chmod full-border starship;
    };
    initLua = ''
      require("full-border"):setup()
      require("starship"):setup()
    '';
    keymap.mgr.prepend_keymap = [
      {
        on = "T";
        run = "plugin toggle-pane max-preview";
        desc = "Maximize or restore the preview pane";
      }
      {
        on = ["c" "m"];
        run = "plugin chmod";
        desc = "Chmod on selected files";
      }
    ];
  };
}
