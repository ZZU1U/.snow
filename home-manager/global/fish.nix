{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  home.packages = with pkgs.fishPlugins; [
    done
    sponge
  ];
}
