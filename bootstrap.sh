#!/bin/bash

brew tap chrokh/tap
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install \
    asdf \
    bash \
    bash-completion@2 \
    cmake \
    coreutils \
    curl \
    docker-completion \
    docker-compose-completion \
    fd \
    findutils \
    gawk \
    git \
    gnu-sed \
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
