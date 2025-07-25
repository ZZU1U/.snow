{ pkgs, stillPkgs, ... }: {
  services.yabai = {
    enable = true;
    package = stillPkgs.yabai;
    enableScriptingAddition = true;
    config = {
      # external_bar = "all:39:0";
      layout = "float";
      # auto_balance = "off";

      # mouse_modifier = "alt";
      # # set modifier + right-click drag to resize window (default: resize)
      # mouse_action2 = "resize";
      # # set modifier + left-click drag to resize window (default: move)
      # mouse_action1 = "move";

      # gaps
      top_padding = 7;
      bottom_padding = 7;
      left_padding = 7;
      right_padding = 7;
      window_gap = 7;
    };
    extraConfig = ''
      sudo yabai --load-sa
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

      # rules
      yabai -m rule --add app="^System Settings$"    manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off
      yabai -m rule --add title="Preferences$"       manage=off
      yabai -m rule --add title="Settings$"          manage=off
      yabai -m rule --add app="^Finder$" manage=off
      yabai -m rule --add app="^Digital Colou?r Meter$" sticky=on
    '';
  };
   # Optional: create service wrappers for yabai/skhd to run as user
  # launchd.user.agents.yabai = {
  #   serviceConfig = {
  #     ProgramArguments = [ "${pkgs.yabai}/bin/yabai" ];
  #     KeepAlive = true;
  #     RunAtLoad = true;
  #   };
  # };
# Allow yabai scripting additions (you must run `sudo yabai --install-sa`)
  # security.accessibilityPrograms = [ "${pkgs.yabai}/bin/yabai" ];
  # security.inheritEnvironment = true;
}
