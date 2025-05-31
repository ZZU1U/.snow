alias r := switch
alias g := garbage

# rebuild and switch config
switch:
  darwin-rebuild switch --flake .

# cleanup garbage
garbage:
  nix-store --gc
