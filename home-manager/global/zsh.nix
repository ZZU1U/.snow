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

    oh-my-zsh = { # "ohMyZsh" without Home Manager
      enable = true;
      plugins = [ "git" ];
    };

    initContent = ''
      autoload -U colors && colors
      bindkey -e
      PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "
    '';
  };
}
