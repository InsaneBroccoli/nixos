{ ... }:
{
  programs.readline = {
    enable = true;

    variables = {
      completion-ignore-case = true;
      completion-map-case = true;
      show-all-if-ambiguous = true;
    };

    extraConfig = ''
      "\e[B": history-search-forward
      "\e[A": history-search-backward
    '';
  };
}
