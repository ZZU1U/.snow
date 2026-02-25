{ pkgs, ... } :{
  imports = [
    ./nixCats.nix
  ];

  environment.systemPackages = with pkgs; [
    raycast
    anki-bin
    iina
    utm
    keycastr
  ];
}
