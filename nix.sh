# Install Nix Package Manager
curl https://nixos.org/nix/install | sh

# Install Alacritty
nix-env -iA nixpkgs.alacritty

# Install Tmux
nix-env -iA nixpkgs.tmux

# Install python and ruby
nix-env -iA nixpkgs.ruby
nix-env -iA nixpkgs.python

# Install Utils
nix-env -iA nixpkgs.exa         # color ls
nix-env -iA nixpkgs.tig         # gui git
nix-env -iA nixpkgs.jq          # json grabber
nix-env -iA nixpkgs.ranger      # cli explorer

# Install Python Utils
pip install howdoi              # code Cheat Sheets
pip install Pygments            # color Cat

# Install Ruby Utils
gem install colorls             # pretty ls with icons