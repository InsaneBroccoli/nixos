{ ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "monokai-pro";
      theme_background = false;
      truecolor = true;
      vim_keys = true;
    };

    themes.monokai-pro = ''
      # Monokai Pro (default filter) — palette mirrors home/quickshell/dots/Theme.qml
      theme[main_bg]=""
      theme[main_fg]="#FCFCFA"
      theme[title]="#FCFCFA"
      theme[hi_fg]="#78DCE8"
      theme[selected_bg]="#403E41"
      theme[selected_fg]="#FCFCFA"
      theme[inactive_fg]="#5B595C"
      theme[graph_text]="#939293"
      theme[meter_bg]="#403E41"
      theme[proc_misc]="#AB9DF2"

      theme[cpu_box]="#AB9DF2"
      theme[mem_box]="#A9DC76"
      theme[net_box]="#FC9867"
      theme[proc_box]="#78DCE8"
      theme[div_line]="#5B595C"

      # severity: green -> yellow -> red
      theme[temp_start]="#A9DC76"    theme[temp_mid]="#FFD866"    theme[temp_end]="#FF6188"
      theme[cpu_start]="#A9DC76"     theme[cpu_mid]="#FFD866"     theme[cpu_end]="#FF6188"
      theme[used_start]="#A9DC76"    theme[used_mid]="#FFD866"    theme[used_end]="#FF6188"

      # single-hue ramps, dark -> bright
      theme[free_start]="#4FC9D8"       theme[free_mid]="#78DCE8"       theme[free_end]="#B4E9F0"
      theme[cached_start]="#8B77EC"     theme[cached_mid]="#AB9DF2"     theme[cached_end]="#CFC5F7"
      theme[available_start]="#F97A3B"  theme[available_mid]="#FC9867"  theme[available_end]="#FDC0A2"
      theme[download_start]="#4FC9D8"   theme[download_mid]="#78DCE8"   theme[download_end]="#B4E9F0"
      theme[upload_start]="#FF2D63"     theme[upload_mid]="#FF6188"     theme[upload_end]="#FFA0B7"

      # low-usage processes stay muted, hot ones shout
      theme[process_start]="#C1C0C0"  theme[process_mid]="#FFD866"  theme[process_end]="#FF6188"
    '';
  };
}
