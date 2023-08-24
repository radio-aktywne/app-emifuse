#!/usr/bin/env bash

# Setup nix config
sudo mkdir -p "/home/${USER}/.config"
sudo chown -R "${USER}:" "/home/${USER}/.config"
sudo ln -s "/nixconfig" "/home/${USER}/.config/nix"

# Setup shell history cache
sudo mkdir -p "/shellhistory/${USER}"
sudo chown -R "${USER}:" "/shellhistory/${USER}"
touch "/shellhistory/${USER}/.bash_history"
touch "/shellhistory/${USER}/.zsh_history"

# Setup trunk cache
sudo mkdir -p "/trunk/${USER}"
sudo chown -R "${USER}:" "/trunk/${USER}"

# Setup npm cache
sudo mkdir -p "/npm/${USER}"
sudo chown -R "${USER}:" "/npm/${USER}"

# Setup bash
cat <<EOF >>~/.bashrc
eval "\$(direnv hook bash)"
eval "\$(starship init bash)"
export HISTFILE='/shellhistory/${USER}/.bash_history'
export TRUNK_CACHE='/trunk/${USER}'
export NPM_CONFIG_CACHE='/npm/${USER}'
EOF

# Setup zsh
cat <<EOF >>~/.zshrc
eval "\$(direnv hook zsh)"
eval "\$(starship init zsh)"
export HISTFILE='/shellhistory/${USER}/.zsh_history'
export TRUNK_CACHE='/trunk/${USER}'
export NPM_CONFIG_CACHE='/npm/${USER}'
EOF
