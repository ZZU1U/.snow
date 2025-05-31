{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true; # ignore commands starting with a space
      save = 20000;
      size = 20000;
      share = true;
    };

    initContent = ''
      autoload -U colors && colors
      autoload -U compinit; compinit

      bindkey -e
      PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "

      # Basic auto/tab complete:
      autoload -U compinit
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)		# Include hidden files.

      fpath+=/Applications/OrbStack.app/Contents/MacOS/../Resources/completions/zsh% 
    '';

    shellAliases = {
      ls = "ls --color=auto";
      zerotier_reload="sudo launchctl load -w /Library/LaunchDaemons/com.zerotier.one.plist";
    };
    #   psf = "ps -aux | grep";
    #   lsf = "ls | grep";
    #   tssh = "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
    #   socks = "ssh -D 1337 -q -C -N";
    #   prox =
    #     "export http_proxy=socks5://127.0.0.1:1337 https_proxy=socks5://127.0.0.1:1337";
    #
    #   # clean
    #   dklocal =
    #     "docker run --rm -it -v `PWD`:/usr/workdir --workdir=/usr/workdir";
    #   dkclean = "docker container rm $(docker container ls -aq)";
    #
    #   gclean =
    #     "git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done";
    #   weather = "curl -4 http://wttr.in/Koeln";
    #
    #   # nix
    #   ne = "nvim -c ':cd ~/.nixpkgs' ~/.nixpkgs";
    #   nf = "nix run nix-darwin -- switch --flake ~/.nixpkgs";
    #   clean =
    #     "nix-collect-garbage -d && nix-store --gc && nix-store --verify --check-contents && nix store optimise";
    #   nsh = "nix-shell";
    #   nse = "nix search nixpkgs";
    # };

    # plugins = [
    #   {
    #     name = "fast-syntax-highlighting";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "zdharma-continuum";
    #       repo = "fast-syntax-highlighting";
    #     };
    #   }
    # ];
  };
}
