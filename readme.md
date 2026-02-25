# ❄️ dotfiles

Trying to keep it minimal

Features that I like the most:
- useful just commands
- multiple systems setup (though I primarly use one)
- nix darwin with some osx options configured
- **Determinate Nix integration** for enhanced performance and security

## Setup

This configuration uses:
- **nix-darwin** for macOS system management
- **Determinate Nix** for optimized Nix experience with parallel evaluation and lazy trees
- **home-manager** for user-level configuration
- **fish shell** with modern replacements for common tools

### Quick Start

1. Install Determinate Nix:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. Apply the configuration:
   ```bash
   just switch
   ```

### Useful Commands

- `just switch` - Rebuild and switch to new configuration
- `just build` - Build configuration without switching
- `just check` - Check configuration for errors
- `just update` - Update flake inputs
- `just determinate-status` - Check Determinate Nix status

darwin setup:
![screenshot](./assets/desktop.png)

