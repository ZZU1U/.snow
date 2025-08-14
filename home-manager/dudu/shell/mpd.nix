{ ... }: {
  services.mpd = {
    enable = true;
    musicDirectory = "~/music";
    extraConfig = ''
    audio_output {
        type		"osx"
        name		"macos output device"
    }
    '';
  };
}
