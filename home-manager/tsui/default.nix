{ pkgs, ... }: {
  imports = [
    ./shell
    ./apps
    ../global
  ];

  programs.home-manager.enable = true;
}
