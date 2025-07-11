{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    enableZshIntegration = true;
    settings = {
      theme = "Wez";
      font-size = 14;
      macos-icon = "retro";
      macos-icon-frame = "plastic";
    };
  };
}
