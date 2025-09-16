{ pkgs, ... }: {
  environment.systemPackages = with pkgs.fishPlugins; [
    done
    sponge
  ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
}
