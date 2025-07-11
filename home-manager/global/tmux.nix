{ config, pkgs, ... }: {
  home.packages = [
    (pkgs.writeShellScriptBin "rebugu_cmus_status" (builtins.readFile ./scripts/cmus_status.sh))
    (pkgs.writeShellScriptBin "rebugu_op" (builtins.readFile ./scripts/op.sh))
    (pkgs.writeShellScriptBin "rebugu_od" (builtins.readFile ./scripts/od.sh))
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
      set -s escape-time 0
      set-option -sa terminal-features ',xterm-256color:RGB'
      set-option -g allow-passthrough on
      unbind C-b
      set-option -g prefix C-SPACE
      bind-key C-SPACE send-prefix
      bind r source-file ~/.config/tmux/tmux.conf
      set -g base-index 1

      # set-option remain-on-exit on
      set -g renumber-windows on   # renumber all windows when any window is closed
      set -g escape-time 0         # zero-out escape time delay
      set-window-option -g mode-keys vi
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'pbcopy'

      # style
      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-style 'fg=color8 bg=default'
      set -g status-right "#(rebugu_cmus_status) | %H:%M %d-%b"
      set -g status-interval 5
      # set -g status-left '#{pane_current_path}'
      # set -g status-right \'\'
      set -g status-left '#{b:pane_current_path}'
      # set-option -g automatic-rename on
      set -g status-left-style 'fg=color8'
      set -g status-right-length 0
      set -g status-left-length 100
      setw -g window-status-current-style 'fg=#0099D7 bg=default bold'
      setw -g window-status-current-format '#I:#W '
      setw -g window-status-style 'fg=color8' # dim mb

      # vim-like pane switching
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      # Scripts that are baked into tmux
      bind G new-window -n 'lazygit' lazygit
      bind-key b set-option status
      # Custom scripts
      bind-key f run-shell "tmux neww rebugu_od"
    '';
  };
}
