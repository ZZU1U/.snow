{ pkgs, ... }: {
  services.skhd = {
    enable = true;  # Permissions break sometimes (like yabai)
    skhdConfig = ''
      alt + shift - return : open -na /Users/dudu/Applications/Alacritty.app

      alt - h : yabai -m window --resize right:-20:0 2> /dev/null || yabai -m window --resize left:-20:0 2> /dev/null
      alt - l : yabai -m window --resize right:20:0 2> /dev/null || yabai -m window --resize left:20:0 2> /dev/null
      alt - j : yabai -m window --focus next || yabai -m window --focus first
      alt - k : yabai -m window --focus prev || yabai -m window --focus last

      alt + shift - j : yabai -m window --swap next || yabai -m window --swap first
      alt + shift - k : yabai -m window --swap prev || yabai -m window --swap last

      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt + shift - 1 : yabai -m window --space 1
      alt + shift - 2 : yabai -m window --space 2
      alt + shift - 3 : yabai -m window --space 3
      alt + shift - 4 : yabai -m window --space 4
      alt + shift - 5 : yabai -m window --space 5
      alt + shift - 6 : yabai -m window --space 6

      alt - t : yabai -m config layout bsp
      alt - f : yabai -m config layout float
      alt - m : yabai -m window --toggle zoom-parent
      alt - d : yabai -m space --toggle show-desktop
      alt - q : yabai -m space --destroy
      alt - n : yabai -m space --create
      alt - w : yabai -m space --rotate 90

      alt + shift - t : open /Applications/Telegram.app/
      alt + shift - a : open /Applications/Arc.app/

      alt + shift - c : yabai -m window --close
      alt - space : yabai -m window --toggle float
      alt + shift - r : yabai --reload-service
    '';
  };

  # launchd.user.agents.skhd = {
  #   serviceConfig = {
  #     ProgramArguments = [ "${pkgs.skhd}/bin/skhd" ];
  #     KeepAlive = true;
  #     RunAtLoad = true;
  #   };
  # };
}
