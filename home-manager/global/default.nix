{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./git.nix
    ./tmux.nix
    ./ghostty.nix
    # ./rio.nix  # broken as of 08/14/25
  ];
}
