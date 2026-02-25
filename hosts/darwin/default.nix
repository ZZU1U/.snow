{ pkgs, flakeSelf, inputs, ... }:
let
  user = "tsui";
  hostname = "tekonaide";
  system = "aarch64-darwin";
in {
  imports = [
    inputs.nix-index-database.darwinModules.nix-index
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.home-manager.darwinModules.home-manager
    inputs.nur.modules.darwin.default
    ./apps
    ./looks
    ./services
    ./shell
    ./system
  ];

  system = {
    primaryUser = user;
    stateVersion = 6;
    configurationRevision = flakeSelf.rev or flakeSelf.dirtyRev or null;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "before-nix-darwin";

    extraSpecialArgs = {
      inherit inputs;
      inherit user;
    };
    users.${user} = { ... }: {
      imports = [
        ../../home-manager/${user}
      ];
      home.stateVersion = "25.11";
    };
  };

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.fish;
    uid=501;
  };
  users.knownUsers = [user];

  networking = {
    computerName = hostname;
    hostName = hostname;
    localHostName = hostname;
  };

  nix-homebrew = {
    enable = true;
    #enableRosetta = true;
    user = user;
    #autoMigrate = true;
  };

  nix = {
    # enable flakes per default
    enable = false;
    package = pkgs.nixVersions.stable;
    settings = {
      allowed-users = [ "*" ];
      trusted-users = [ "root" user ];
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
      auto-optimise-store = false;
    };
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
