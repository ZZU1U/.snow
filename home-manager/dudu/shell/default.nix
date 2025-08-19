{ pkgs, ... }: {
  imports = [
    ./direnv.nix
    ./taskwarrior.nix
    ./mpd.nix
  ];

  home = {
    packages = with pkgs; [
      # net tools
      nmap

      # core
      wget
      curl
      fd
      ripgrep # fast search
      gitAndTools.delta # pretty diff tool
      gh # github cli tool
      ffmpeg # video editing and cutting
      httpie # awesome alternative to curl
      gnupg # gpg
      gping # ping with a graph
      # comma # run nix binaries on demand
      mosh # better ssh

      # gnu binaries
      coreutils-full # multiple tools
      gnutar
      gnumake

      # programming
      uv # workspace management tool
      just
      cmake
      gcc
      python310  # sometimes help
      cargo
      rustc

      jujutsu  # git future

      ## lsps
      lua-language-server
      rust-analyzer

      # stuff
      pfetch
      ollama

      # writing
      typst
      tinymist
      ispell

      # passwords (don't really use it anyway)
      # pass
      # passExtensions.pass-import

      # music player
      cmus
      rmpc
      mpc
      # playerctl  # marked as broken as of 08/14/25
    ];

    shellAliases = {
      # builtins
      ls = "ls --color";
      size = "du -sh";
      cp = "cp -i";
      mkdir = "mkdir -p";
      df = "df -h";
      free = "free -h";
      du = "du -sh";
      del = "rm -rf";
      lst = "ls --tree -I .git";
      ll = "ls -l";
      la = "ls -a";
      lla = "ls -a -l";
      null = "/dev/null";

      # overrides
      cat = "bat";
      top = "btop";
      ping = "gping";
      diff = "delta";
      ssh = "TERM=screen ssh";
      python = "python3";
      pip = "python3 -m pip";
      venv = "python3 -m venv";

      # programs
      g = "git";
      d = "docker";
      dc = "docker-compose";
      t = "tmux attach || tmux";
    };

    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
  };

  programs = {
    # shell integrations are enabled by default
    bat.enable = true; # pretty cat
    lazygit.enable = true; # git tui
    btop.enable = true; # htop alternative

    skim = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
