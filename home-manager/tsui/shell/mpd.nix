{ ... }: {
  services.mpd = {
    enable = false;
    musicDirectory = "~/music";
    extraConfig = ''
    audio_output {
        type		"osx"
        name		"macos output device"
    }
    '';
  };
}
