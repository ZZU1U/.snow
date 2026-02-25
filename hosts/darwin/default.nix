{ pkgs, flakeSelf, inputs, ... }:
let
  user = "tsui";
  hostname = "tekonaide";
  system = "aarch64-darwin";
in {
  imports = [
    inputs.determinate.darwinModules.default
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

  # Determinate Nix configuration
  determinateNix = {
    enable = true;
    # Custom settings for additional caches and optimizations
    customSettings = {
      # Add your custom substituters here if needed
      # trusted-substituters = "https://your-cache.example.com";
      # trusted-public-keys = "your-cache.example.com:key";
    };
    # Configure Determinate Nixd for enhanced performance
    determinateNixd = {
      garbageCollector.strategy = "automatic";
    };
  };

  nix = {
    # Let Determinate Nix handle Nix configuration
    enable = false;
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
