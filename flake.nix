{
  description = "my dotfiles";
# Example taken from https://github.com/breuerfelix/dotfiles/
# and from https://github.com/dustinlyons/nixos-config/
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nixCats.url = "github:ZZU1U/nixCats";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager, utils, agenix, nur, ... }@inputs:
  let
    stillPkgs = import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/fabee8e1bcf70fee0cd7dbfdbd2f04ff43e780c9.tar.gz";
      sha256 = "sha256:0msdy4n3d9b608my4wlc3401ar0lzyyn04lf847acp4cs2lp6km2";
    }) { system = "aarch64-darwin"; };

    basicPackagesConfig = ({ ... } : {
      nixpkgs.config = {
        allowUnfree = true;
        allowUnsupportedSystem = false;
        packageOverrides = pkgs: {
          nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") {
            inherit pkgs;
          };
        };
      };
    });
  in {
    #formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;

    darwinConfigurations.dadoot = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit inputs; flakeSelf = self; stillPkgs = stillPkgs; };
      modules = [
        basicPackagesConfig
        ./hosts/darwin
      ];
    };

    nixosConfigurations = {
      yoshi = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/yoshi
          utils.nixosModules.autoGenFromInputs
          home-manager.nixosModules.home-manager
          agenix.nixosModules.age
        ];
      };
    };
  };
}
