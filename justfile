alias s := switch
alias r := switch
alias g := garbage
alias u := update

# rebuild and switch config
switch:
  sudo darwin-rebuild switch --flake . --show-trace

# build config without switching
build:
  sudo darwin-rebuild build --flake .

# check config for errors
check:
  sudo darwin-rebuild check --flake .

# cleanup garbage
garbage:
  sudo nix-store --gc

# delete old generations data
clean-gen:
  sudo nix-collect-garbage -d; sudo nix-collect-garbage -d

# update flake inputs
update:
  sudo nix flake update

# cleanup permissions
acc-perm:
  sudo tccutil reset Accessibility

# list previous generations
hist:
    sudo darwin-rebuild --list-generations

# Determinate Nix specific commands
# Check Determinate Nix status
determinate-status:
  determinate-nix status

# Check Determinate Nixd status
determinate-nixd-status:
  determinate-nixd status

# Show Determinate Nix configuration
determinate-config:
  cat /etc/nix/nix.conf


