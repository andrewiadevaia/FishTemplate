#!/bin/bash
mkdir -p /temp

apt-get update
apt-get upgrade -y
apt-get install gpg git sudo curl wget nano htop exa tree net-tools unzip python3 python3-pip python3-dev -y

# Add the fish repo
gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/fish.gpg --keyserver keyserver.ubuntu.com --recv-keys 59FDA1CE1B84B3FAD89366C027557F056DC33CA5
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/fish.gpg] https://ppa.launchpadcontent.net/fish-shell/release-3/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/fish-shell.list > /dev/null
apt-get update

# Install batcat
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb
sudo dpkg -i bat_0.24.0_amd64.deb

# Install Packages
apt install fd-find fish  -y

# Clone repo and copy to home directory
git clone https://github.com/andrewiadevaia/FishTemplate.git /temp/FishTemplate
cp -r /temp/FishTemplate/.config ~/

cp /temp/FishTemplate/gitconfig/* ~

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
