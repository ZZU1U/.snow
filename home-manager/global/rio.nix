{ ... }: {
  programs.rio = {
    enable = true;
    settings = ''
      hide-cursor-when-typing = true
      env-vars = [
          "TERM=xterm-256color"
      ]

      [navigation]
      mode = "toptab"
      clickable = false
      hide-if-single = true
      use-current-path = false
    '';
  };
}
