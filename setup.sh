#!/bin/bash

echo "------------------------"
echo "Kirima2nd dotfiles setup"
echo "------------------------"
echo ""

echo "Add resources and layout"
cp -r .Xresources ~/.Xresources
cp -r .bashrc ~/.bashrc
cp -r .profile ~/.profile

cp -r .screenlayout/monitor.sh ~/.screenlayout/monitor.sh

echo "Replacing ~/.config with new ones"

rm -rf ~/.config/dconf
cp -r .config/dconf ~/.config/dconf

rm -rf ~/.config/dunst
cp -r .config/dunst ~/.config/dunst

rm -rf ~/.config/i3
cp -r .config/i3/ ~/.config/i3

rm -rf ~/.config/kitty
cp -r .config/kitty ~/.config/kitty

rm -rf ~/.config/nitrogen
cp -r .config/nitrogen ~/.config/nitrogen

rm -rf ~/.config/neofetch
cp -r .config/neofetch ~/.config/neofetch

rm -rf ~/.config/pulse
cp -r .config/pulse ~/.config/pulse

rm -rf ~/.config/rofi
cp -r .config/rofi ~/.config/rofi

rm -rf ~/.config/xed
cp -r .config/xed ~/.config/xed

rm -rf ~/.config/xfce4
cp -r .config/xfce4 ~/.config/xfce4

cp -r .config/picom.conf ~/.config/picom.conf
cp -r .config/welcome.conf ~/.config/welcome.conf
cp -r .config/pavucontrol.ini ~/.config/pavucontrol.ini

echo "Installing Aditional Software"

sudo pacman -Syyu kitty xfce4-settings neovim simplescreenrecorder lib32-simplescreenrecorder
sudo pacman -Rs xfce4-terminal

echo "Fix thunar issues with terminal emulators"

mkdir -p ~/.local
mkdir -p ~/.local/share
mkdir -p ~/.local/share/applications

cp -r .local/share/applications/nvim.desktop ~/.local/share/applications/nvim.desktop

read -r -p "Installation complete, do you want to reboot? [Y/n] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        sudo reboot
        ;;
    *)
        exit 0
        ;;
esac

