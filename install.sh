#!/bin/sh

# https://wiki.debian.org/Xorg
sudo apt install -y xorg i3
mkdir -p ~/.config/i3
cp config/i3/* ~/.config/i3
sudo dpkg-reconfigure keyboard-configuration

# TODO: configure git
# TODO: show volume indicator with keyboard
# TODO: font
# TODO: laptop power management
# TODO: printer
# TODO: copy file type associations

## Network
sudo apt install -y network-manager-gnome

# Sound
sudo apt install -y pavucontrol pulseaudio pulseaudio-utils pasystray paprefs pavumeter pulseaudio-module-zeroconf

# Bluetooth 
sudo apt install -y blueman pulseaudio-module-bluetooth

# Hack nerd fonts
sudo apt install -y curl unzip zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
mkdir -p ~/.local/share/fonts
unzip Hack.zip -d ~/.local/share/fonts/
fc-cache


# st terminal
sudo apt install -y xorg-dev build-essential git
git clone https://github.com/dimitrimarion/st-flexipatch.git
cd st-flexipatch
sudo make clean install
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/st 40
sudo update-alternatives --set x-terminal-emulator /usr/local/bin/st
cd -

# vim
sudo apt install -y vim
cp config/vimrc ~/.vimrc
sudo update-alternatives --set editor /usr/bin/vim.basic

# file manager
sudo apt install -y pcmanfm

# image viewer
sudo apt install -y nsxiv
sudo cp bin/cnsxiv /usr/local/bin
sudo chmod +x /usr/local/bin
mkdir -p ~/.local/share/applications
cp applications/* ~/.local/share/applications
cp config/mimeapps.list ~/.config

# mail
# gmail sign in with app passwords: https://support.google.com/mail/answer/185833?hl=en
sudo apt install -y sylpheed sylpheed-plugins

# pdf
sudo apt install -y zathura
mkdir ~/.config/zathura
cp config/zathurarc ~/.config/zathura/zathurarc

# video player
sudo apt install -y mpv

# screenshot
sudo apt install -y flameshot

# pager
sudo apt install -y most
sudo update-alternatives --set pager /usr/bin/most

# password manager
sudo apt install -y keepassxc

# docker
sudo apt install -y docker-compose
sudo usermod -aG docker $USER


# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
. ~/.bashrc
nvm install --lts

# vscode
sudo apt-get install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gp
sudo apt install apt-transport-https
sudo apt update
sudo apt install code


# autostart X at login
cp config/.profile ~/.profile

# Deactivate laptop monitor if external connected 
# https://wiki.archlinux.org/title/xrandr #Toggle_external_monitor
#sudo vim /usr/share/sddm/scripts/Xsetup # deactivate laptop monitor

###
sudo apt install -y tldr xsel htop firefox-esr

# wallpapers
git clone https://gitlab.com/dwt1/wallpapers.git ~/Pictures

# starship
curl -sS https://starship.rs/install.sh | sh
cp config/.bashrc ~/.bashrc
