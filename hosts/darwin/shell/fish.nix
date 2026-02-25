{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    fish
    fishPlugins.done
    # fishPlugins.fzf-fish # broken
    fzf
    eza
    bat
    ripgrep
    fd
  ];

  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
      set fish_greeting
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      
      # Better ls
      alias ls "eza -la --git --icons"
      alias ll "eza -l --git --icons"
      alias la "eza -la --git --icons"
      
      # Better find
      alias find "fd"
      
      # Better grep
      alias grep "rg"
      
      # Cat with syntax highlighting
      alias cat "bat"
      
      # Nix shortcuts
      alias nrs "sudo darwin-rebuild switch --flake ."
      alias nrb "darwin-rebuild build --flake ."
      alias nrl "darwin-rebuild switch --flake . --show-trace"
    '';

    shellAbbrs = {
      gc = "nix-store --gc";
      gcu = "sudo nix-collect-garbage -d";
      upd = "nix flake update";
    };
  };
}
