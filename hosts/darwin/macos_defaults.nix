{ config, pkgs, ... }: {
  system = {
    keyboard = {
#     enableKeyMapping = true;
      #remapCapsLockToControl = true;  # This needs ^^^ to be made but idk
    };
#
    defaults = {
#     ".GlobalPreferences"."com.apple.mouse.scaling" = 4.0;
#     spaces.spans-displays = false;
#     universalaccess = {
#       # FIXME: cannot write universal access
#       #reduceMotion = true;
#       #reduceTransparency = true;
#     };
#
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        orientation = "bottom";
        dashboard-in-overlay = true;
        largesize = 85;
        tilesize = 16;
        magnification = true;
        launchanim = false;
        mru-spaces = false;
        show-recents = false;
        show-process-indicators = true;
        # persistent-apps = [
        #   {
        #     folder = "/Users/dudu/Downloads";
        #   }
        # ];
        # persistent-others = [
        #   "/Users/dudu/Downloads"
        # ];
      };
#
#     finder = {
#       AppleShowAllExtensions = true;
#       AppleShowAllFiles = true;
#       CreateDesktop = false;
#       FXDefaultSearchScope = "SCcf"; # current folder
#       QuitMenuItem = true;
#     };
#
#     NSGlobalDomain = {
#       _HIHideMenuBar = false;
#       AppleFontSmoothing = 0;
#       AppleInterfaceStyle = "Dark";
#       AppleKeyboardUIMode = 3;
#       AppleScrollerPagingBehavior = true;
#       AppleShowAllExtensions = true;
#       AppleShowAllFiles = true;
#       InitialKeyRepeat = 10;
#       KeyRepeat = 2;
#       NSAutomaticSpellingCorrectionEnabled = false;
#       NSAutomaticWindowAnimationsEnabled = false;
#       NSWindowResizeTime = 0.0;
#       "com.apple.sound.beep.feedback" = 0;
#       "com.apple.trackpad.scaling" = 2.0;
#     };
    };
  };

  # local = {
  #   dock.entries = [
  #   { path = "${pkgs.firefox}/Applications/Firefox.app/"; }
  #   { path = "/Applications/Safari.app/"; }
  #   { path = "/Applications/Books.app/"; }
  #   { path = "${pkgs.alacritty}/Applications/Alacritty.app/"; }
  #   { path = "/Applications/Tana.app/"; }
  #   { path = "/Applications/Telegram.app/"; }
  #   { path = "/Applications/WhatsApp.app/"; }
  #   {
  #     path = "~/Downloads";
  #     section = "others";
  #     options = "--sort name --view grid --display stack";
  #   }
  #   ];
  # };
  #
}
