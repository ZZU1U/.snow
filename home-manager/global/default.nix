{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./git.nix
    ./tmux.nix
    ./ghostty.nix
    #./mpd.nix
  ];
}
