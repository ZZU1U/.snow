{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    #enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      theme = "Wez";
      font-size = 14;
      macos-icon = "retro";
      macos-icon-frame = "plastic";
      background-opacity = 1.0;
    };
  };
}
