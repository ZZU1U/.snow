{ config, pkgs, ... }: {
  home.packages = [  # Setup local scripts to be global-like-packages
    (pkgs.writeShellScriptBin "tmux-hop" (builtins.readFile ./scripts/tmux-hop.sh))
    (pkgs.writeShellScriptBin "tmux-sk" (builtins.readFile ./scripts/tmux-sk.sh))
  ];
  
  programs.tmux = {
    enable = true;
    escapeTime = 5;
    baseIndex = 1;
    clock24 = true;

    keyMode = "vi";
    # shell = "${config.home.homeDirectory}/.nix-profile/bin/fish";
    terminal = "tmux-256color";
    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.prefix-highlight
    ];
    extraConfig = /*tmux*/''
      # style
      # set -g status-right-length 0
      # set -g status-left-length 100

      set -a terminal-features ',xterm-256color:RGB'
      setw -g mouse on  # mostly for resizing though
      set -g allow-passthrough on
      set -g prefix C-SPACE
      set -g base-index 1
      set -g renumber-windows on   
      set -g mode-keys vi
      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-style "bg=default"
      set -g window-status-current-style "fg=blue bold"
      set -g status-right ""
      set -g status-left "#S"
      set -g escape-time 0

      bind b set -g status
      bind f run-shell "tmux neww tmux-hop"
      bind N run-shell "tmux-hop ~/documents/notez"
      bind P run-shell "tmux-hop ~/documents/projects"
      bind D run-shell "tmux-hop ~/.snow"
      bind H run-shell "tmux-hop ~"
      bind G neww -n "lazygit" lazygit
    '';
  };
}
