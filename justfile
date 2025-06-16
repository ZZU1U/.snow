alias s := switch
alias r := switch
alias g := garbage
alias u := update

# rebuild and switch config
switch:
  darwin-rebuild switch --flake .

# cleanup garbage
garbage:
  nix-store --gc

# update flake inputs
update:
  nix flake update
