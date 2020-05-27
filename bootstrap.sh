#!/bin/bash
# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap chrokh/tap
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install --HEAD https://raw.githubusercontent.com/junegunn/blsd/master/blsd.rb
brew install \
    bash \
    bash-completion \
    cmake \
    coreutils \
    docker-completion \
    docker-compose-completion \
    fd \
    findutils \
    fpp \
    gawk \
    git \
    gnu-sed \
    go \
    htop \
    moreutils \
    ripgrep \
    tmux \
    v \
    vim \
    wget \
    z

 # Add the brew bash shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

# TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# tmux.conf
mv ~/.tmuxlinesnapshot.conf ~/.tmuxlinesnapshot.conf.bak
ln -s ~/dotfiles/tmuxlinesnapshot.conf ~/.tmuxlinesnapshot.conf
mv ~/.tmux.conf ~/.tmux.conf.bak
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# ignore
mv ~/.ignore ~/.ignore.bak
ln -s ~/dotfiles/ignore ~/.ignore

# vim
mv ~/.vim ~/.vim.bak
ln -s ~/dotfiles/vim ~/.vim

# ctags
mv ~/.ctags.d ~/.ctags.d.bak
ln -s ~/dotfiles/ctags.d ~/.ctags.d

# tern-config
mv ~/.tern-config ~/.tern-config.bak
ln -s ~/dotfiles/tern-config ~/.tern-config

# slate
mv ~/.slate.js ~/.slate.js.bak
ln -s ~/dotfiles/slate.js ~/.slate.js

# gitconfig
echo "[include]
    path = ~/dotfiles/gitconfig"  >> ~/.gitconfig

# vimrc
echo "so ~/dotfiles/vimrc" >> ~/.vimrc

# bash_profile
echo "source ~/dotfiles/bashrc" >> ~/.bash_profile
echo "source ~/dotfiles/bashrc" >> ~/.bashrc

source ~/.bash_profile
