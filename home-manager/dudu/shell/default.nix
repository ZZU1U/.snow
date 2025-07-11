{ pkgs, ... }: {
  imports = [
    ./direnv.nix
    ./taskwarrior.nix
  ];

  home = {
    packages = with pkgs; [
      # ok look, i can explain. i'm using it just to test some plugins ok?
      neovim
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
      comma # run nix binaries on demand

      # gnu binaries
      coreutils-full # multiple tools
      gnutar
      gnumake

      # programming
      uv # workspace management tool
      just

      # stuff
      pfetch
      typst
    ];

    shellAliases = {
      # builtins
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
    yazi.enable = true; # file browser
    btop.enable = true; # htop alternative

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand =
        "fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache --exclude vendor --exclude node_modules";
      defaultOptions = [
        "--inline-info"
          "--height 40%"
          "--tmux top,40%"
          "--layout reverse"
      ];
    };
  };

}
