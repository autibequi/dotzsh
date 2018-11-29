# Install Nix Package Manager
curl https://nixos.org/nix/install | sh

# Install Alacritty
nix-env -iA nixpkgs.alacritty

# Install Tmux
nix-env -iA nixpkgs.tmux

# Install Utils
nix-env -iA nixpkgs.exa
nix-env -iA nixpkgs.tig
nix-env -iA nixpkgs.jq