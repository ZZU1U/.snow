alias s := switch
alias r := switch
alias g := garbage
alias u := update

# rebuild and switch config
switch:
  darwin-rebuild switch --flake . --show-trace

# cleanup garbage
garbage:
  nix-store --gc

# update flake inputs
update:
  nix flake update

# cleanup permissions
acc-perm:
  sudo tccutil reset Accessibility
