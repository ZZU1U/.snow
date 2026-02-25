{ pkgs, ... }: {
  programs.ghostty = {
    enable = false; # i'm gonna be removing this one as for nov 8 2025 it doesn't have all features sadly
    package = pkgs.ghostty-bin;
    enableFishIntegration = true;
    themes = {
      blood-moon = {
        background = "#10100E";
        foreground = "#C6C6C4";

        palette = [
          "0=#10100E"
          "1=#C40233"
          "2=#009F6B"
          "3=#FFD700"
          "4=#0087BD"
          "5=#9A4EAE"
          "6=#20B2AA"
          "7=#C6C6C4"
          "8=#696969"
          "9=#FF2400"
          "10=#03C03C"
          "11=#FDFF00"
          "12=#007FFF"
          "13=#FF1493"
          "14=#00CCCC"
          "15=#FFFAFA"
        ];
      };
    };
    settings = {
      theme = "Moonfy";
      font-size = 16;
      background-opacity = 0.9;
    };
  };
}
