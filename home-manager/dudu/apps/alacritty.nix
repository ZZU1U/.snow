{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        dynamic_padding = true;
        padding = {
          x = 0;
          y = 0;
        };
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      mouse = { hide_when_typing = true; };

      font = let fontname = "FiraCode Nerd Font";
      in {
        normal = {
          family = fontname;
        };
        bold = {
          family = fontname;
        };
        italic = {
          family = fontname;
        };
        size = 17;
      };
      cursor.style = "Block";

      colors = {
        primary = {
          background = "#10100E";
          foreground = "#C6C6C4";
        };

        normal = {
          black =   "#10100E";
          red =     "#C40233";
          green =   "#009F6B";
          yellow =  "#FFD700";
          blue =    "#0087BD";
          magenta = "#9A4EAE";
          cyan =    "#20B2AA";
          white =   "#C6C6C4";
        };

        bright = {
          black =   "#696969";
          red =     "#FF2400";
          green =   "#03C03C";
          yellow =  "#FDFF00";
          blue =    "#007FFF";
          magenta = "#FF1493";
          cyan =    "#00CCCC";
          white =   "#FFFAFA";
        };
      };
    };
  };
  home.file."Applications/Alacritty.app".source = "${pkgs.alacritty}/Applications/Alacritty.app";
}
