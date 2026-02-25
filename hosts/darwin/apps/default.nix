{ pkgs, ... } :{
  imports = [
    ./nixCats.nix
  ];

  environment.systemPackages = with pkgs; [
    raycast
    anki-bin
    iina
    #obs-studio
    #sioyek
    utm
    keycastr
  ];
}
