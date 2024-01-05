#!/bin/bash

sudo apt-get update

sudo apt-get install -y git libevent-dev ncurses-dev build-essential bison pkg-config ripgrep zip unzip xclip make pkg-config nodejs npm tmux

rm -rf /home/user/.config

mkdir -p /home/user/.config

git clone https://github.com/lsmda/nvim /home/user/.config/nvim

git clone https://github.com/lsmda/.dotfiles

git clone https://github.com/tmux-plugins/tpm home/user/.tmux/plugins/tpm

echo "" >> /home/user/.bashrc

cat /home/user/.dotfiles/.bashrc >> /home/user/.bashrc

ln -s /home/user/.dotfiles/tmux/ /home/user/.config/tmux

curl -fsSL https://get.pnpm.io/install.sh | sh -

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

tar xf lazygit.tar.gz lazygit

sudo install lazygit /usr/local/bin

rm lazygit /home/user/lazygit.tar.gz

wget -O JetBrainsMono.zip https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip

unzip /home/user/JetBrainsMono.zip

mv /home/user/fonts/ttf/ /usr/share/fonts/truetype/JetBrainsMono/

rm -rf /usr/share/fonts/truetype/dejavu

rm -rf /home/user/AUTHORS.txt /home/user/JetBrainsMono.zip /home/user/OFL.txt /home/user/fonts

# Download the latest Neovim AppImage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

# Make the AppImage executable
chmod u+x nvim.appimage

# Extract the AppImage
/home/user/nvim.appimage --appimage-extract

# Move extracted Neovim to root directory
sudo mv squashfs-root /

# Create a symbolic link to Neovim in the system bin directory
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# Check the version of Neovim
/squashfs-root/AppRun --version

rm /home/user/nvim.appimage

source /home/user/.bashrc
