{ config, pkgs, ... }: {
  system = {
    keyboard = {
      remapCapsLockToControl = true;
      enableKeyMapping = true;
    };

    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        orientation = "bottom";
        dashboard-in-overlay = true;
        tilesize = 16;
        largesize = 106;
        magnification = true;
        static-only = false;
        launchanim = false;
        mru-spaces = false;
        show-recents = false;
        persistent-apps = [];
        persistent-others = [
          "/Users/tsui/Downloads"
        ];
      };

      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        NewWindowTarget = "Home";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      hitoolbox.AppleFnUsageType = "Change Input Source";
      trackpad.ActuationStrength = 0;
    };
  };
}
