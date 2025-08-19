{ pkgs, ... } : {
  imports = [
    ./firefox.nix
    ./alacritty.nix
  ];

  home.packages = with pkgs; [
    # yabai
    # skhd

    iina
    qbittorrent
    anki-bin
    # obs-studio
    sioyek
    utm
    #wireshark
    # soulseekqt
    gimp
    keycastr
  ];
}
