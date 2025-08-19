{ pkgs, flakeSelf, inputs, ... }:
let
  user = "dudu";
  hostname = "dadoot";
  system = "aarch64-darwin";
in {
  imports = [
    inputs.nix-index-database.darwinModules.nix-index
    # inputs.nixCats.nixosModules.default
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.home-manager.darwinModules.home-manager
    inputs.nur.modules.darwin.default
    ./macos_defaults.nix
    ./fonts.nix
    ./skhd.nix
    ./yabai.nix
    ./borders.nix
    #./nixCats.nix
  ];

  system = {
    primaryUser = user;
    stateVersion = 6;
    configurationRevision = flakeSelf.rev or flakeSelf.dirtyRev or null;
  };

  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
    uid=501;
  };
  users.knownUsers = [user];

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
        ../../home-manager/dudu
      ];
      home.stateVersion = "25.11";
    };
  };

  networking = {
    computerName = hostname;
    hostName = hostname;
    localHostName = hostname;
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = user;
    autoMigrate = true;
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
# produces linking issues when updating on macOS
# https://github.com/NixOS/nix/issues/7273
      auto-optimise-store = false;
    };
  };

  environment = {
    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
    systemPackages = with pkgs; [
      #raycast
    ];
  };

  # programs.nh = {
  #     enable = true;
  #     clean.enable = true;
  #     clean.extraArgs = "--keep-since 4d --keep 3";
  #     flake = "/Users/dudu/.snow";
  # };
}
