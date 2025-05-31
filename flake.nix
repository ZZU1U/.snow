{
  description = "my dotfiles";
  # Example taken from https://github.com/breuerfelix/dotfiles/
  # and from https://github.com/dustinlyons/nixos-config/
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixCats.url = "github:ZZU1U/nixCats";

    # nur = {
    #   url = "github:nix-community/NUR";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, darwin, home-manager, nur, flake-utils, ... }@inputs:
    let
      # nurpkgs = import (builtins.fetchTarball {
      #   url = "https://github.com/nix-community/NUR/archive/main.tar.gz"; 
      #   sha256="1a3in8q90d59vfpdjy422xqdgzvxr01h14n4kclfxyvvdsy2swbj";
      # }) {};

      nixpkgsConfig = {
        allowUnfree = true;
        allowUnsupportedSystem = false;
        packageOverrides = pkgs: {
        };
      };

      unstable = import inputs.nixpkgs-unstable { inherit system; };
      overlays = with inputs; []; # [nurpkgs.repos.ben.overlays.bar]; #[ feovim.overlay krewfile.overlay ];
      user = "dudu";
      hostname = "dadoot";
      system = "aarch64-darwin";
    in {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;

      # nix-darwin with home-manager for macOS
      darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
        inherit system;
        # makes all inputs availble in imported files
        specialArgs = { inherit inputs; inherit unstable; };
        modules = [
          inputs.nix-index-database.darwinModules.nix-index
          inputs.nixCats.nixosModules.default
          ./hosts/darwin
          ({ pkgs, inputs, ... }: {
            nixpkgs.config = nixpkgsConfig;
            nixpkgs.overlays = overlays;

            system = {
              primaryUser = user;
              stateVersion = 6;
              configurationRevision = self.rev or self.dirtyRev or null;
            };

            users.users.${user} = {
              home = "/Users/${user}";
              shell = pkgs.zsh;
              uid=501;
            };
            users.knownUsers = [user];

            networking = {
              computerName = hostname;
              hostName = hostname;
              localHostName = hostname;
            };

            nix = {
              # enable flakes per default
              package = pkgs.nixVersions.stable;
              enable = false;
              # gc.automatic = false;
              settings = {
                allowed-users = [ user ];
                trusted-users = [ "root" user ];
                experimental-features = [ "nix-command" "flakes" ];
                warn-dirty = false;
                substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
                # produces linking issues when updating on macOS
                # https://github.com/NixOS/nix/issues/7273
                auto-optimise-store = false;
              };
            };
          })
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "before-nix-darwin";
              # makes all inputs available in imported files for hm
              extraSpecialArgs = {
                inherit inputs;
                inherit unstable;
                inherit user;
              };
              users.${user} = { ... }:
                with inputs; {
                  imports = [
                    ./home-manager
                    ./shell
                  ];
                  home.stateVersion = "25.11";
                };
            };
          }
        ];
      };
    };
}
