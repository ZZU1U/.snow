{ config, pkgs, ... }: {
  system = {
    keyboard = {
      remapCapsLockToControl = true;
      enableKeyMapping = true;
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

        tilesize = 16;
        largesize = 106;
        magnification = true;
        scroll-to-open = true;  # trying new feature
        static-only = false;

        launchanim = false;

        mru-spaces = false;

        show-recents = false;

        persistent-apps = [
        ];

        persistent-others = [
          "/Users/dudu/Downloads"
        ];
      };

      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf"; # current folder
        NewWindowTarget = "Home";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      hitoolbox.AppleFnUsageType = "Change Input Source";
      trackpad.ActuationStrength = 0;
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
