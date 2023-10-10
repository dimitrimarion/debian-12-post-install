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
# TODO: default editor
# TODO: printer
# TODO: chromium
# TODO: starship
# TODO: docker
# TODO: vscode
# TODO: node
# TODO: image viewer
# TODO: keepassxc
# TODO: copy file type associations
# TODO: update alternative: default terminal (st in /usr/local/bin), browser, editor

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
sudo update-alternatives --set pager /usr/bin/pager


# Deactivate laptop monitor if external connected 
# https://wiki.archlinux.org/title/xrandr #Toggle_external_monitor
#sudo vim /usr/share/sddm/scripts/Xsetup # deactivate laptop monitor


###
sudo apt install -y tldr xsel htop

## git clone dt wallpapers
## 
