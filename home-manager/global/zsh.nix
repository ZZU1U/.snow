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

      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
      zstyle ':completion:*' menu select
    '';
# fpath+=/Applications/OrbStack.app/Contents/MacOS/../Resources/completions/zsh% 

    shellAliases = {
      ls = "ls --color=auto";
      em = "emacs -nw";
    };
  };
}
