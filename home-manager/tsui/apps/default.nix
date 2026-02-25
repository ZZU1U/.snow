{ pkgs, ... } : {
  imports = [
    ./firefox.nix
    ./alacritty.nix
  ];

  home.packages = with pkgs; [
    qbittorrent
    #gimp omg wtf
  ];
}
