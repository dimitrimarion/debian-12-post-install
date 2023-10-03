#!/bin/sh

# https://wiki.debian.org/Xorg
sudo apt install -y xorg i3
cp -R config/i3 ~/.config
sudo dpkg-reconfigure keyboard-configuration

# TODO: configure git
# TODO: show volume indicator with keyboard
# TODO: bluetooth
# TODO: font
# TODO: laptop power management
# TODO: vlc, codec

## Network
sudo apt install -y network-manager-gnome

# Sound
sudo apt install -y pavucontrol pulseaudio pulseaudio-utils pasystray paprefs pavumeter pulseaudio-module-zeroconf

# Sound
sudo apt install blueman pulseaudio-module-bluetooth

# Hack nerd fonts
sudo apt install -y curl unzip
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

# Deactivate laptop monitor if external connected 
# https://wiki.archlinux.org/title/xrandr #Toggle_external_monitor
#sudo vim /usr/share/sddm/scripts/Xsetup # deactivate laptop monitor


###
sudo apt install tldr xsel

## git clone dt wallpapers
## 
