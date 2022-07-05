#!/bin/bash

mkdir /home/logan/.config/
mkdir /home/logan/.fonts/
sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -S xorg git sddm neovim kitty neofetch polybar rofi picom gcc fakeroot make base-devel pkgconf python-pkgconfig feh network-manager-applet xfce4-power-manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R logan:logan ./yay-git
cd yay-git
makepkg -si
yay -Syu
yay --nodiffmenu -S i3-gaps-rounded-git
cd /home/logan/
sudo git clone https://github.com/Lionskey/i3-setup
sudo chown -R logan:logan ./i3-setup
mkdir Pictures
cd i3-setup
cp darkseid.jpg /home/logan/Pictures
cp picom.conf /home/logan/.config/
cp -r .fonts/ /home/logan/
cp -r i3/ /home/logan/.config/ 
cp -r kitty/ /home/logan/.config/ 
cp -r polybar/ /home/logan/.config/ 
cp -r rofi/ /home/logan/.config/
cp -r nvim/ /home/logan/.config/
sudo systemctl enable sddm
sudo ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules
