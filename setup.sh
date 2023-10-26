#!/bin/bash
mkdir -p /temp

apt-get update
apt-get upgrade -y

# Add the fish repo
gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/fish.gpg   --keyserver keyserver.ubuntu.com --recv-keys 59FDA1CE1B84B3FAD89366C027557F056DC33CA5
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/fish.gpg] https://ppa.launchpadcontent.net/fish-shell/release-3/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/fish-shell.list > /dev/null
apt-get update

# Install Packages
apt install git sudo curl wget nano htop exa tree python3-pip fzf fd-find fish bat tree net-tools -y

# Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git /temp/.fzf
/temp/.fzf/install --bin
cp /temp/.fzf/bin/fzf /usr/local/bin/fzf

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Modify Instance Specific Settings
USER=$(whoami)
# replace the username for paths in the fish_variables
sed -i "s/CHANGEME/$USER/g" ~/.config/fish/fish_variables