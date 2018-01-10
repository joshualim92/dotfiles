#!/bin/bash
# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap chrokh/tap
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install gnu-sed --with-default-names
brew install macvim --with-override-system-vim

brew install \
    base16-manager \
    bash \
    ccat \
    cmake \
    coreutils \
    findutils \
    fpp \
    git \
    htop \
    node \
    ripgrep \
    the_silver_searcher \
    tmux \
    tree \
    z

brew tap caskroom/fonts
brew cask install font-fira-code

 # Add the brew bash shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

# bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --interactive

# Install base16-manager dependencies
mv ~/.config ~/.config.bak
mkdir ~/.config
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
base16-manager install chriskempson/base16-shell
base16-manager install chriskempson/base16-vim
base16-manager install nicodebo/base16-fzf

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

# gitconfig
echo "[include]
    path = ~/dotfiles/gitconfig"  >> ~/.gitconfig

# vimrc
echo "so ~/dotfiles/vimrc" >> ~/.vimrc

# bash_profile
echo "source ~/dotfiles/bashrc" >> ~/.bash_profile
echo "source ~/dotfiles/bashrc" >> ~/.bashrc

# Write out current crontab
crontab -l > mycron
# Echo new cron into cron file
echo "* * * * * ~/dotfiles/setbase16theme.sh >/dev/null 2>&1" >> mycron
# Install new cron file
crontab mycron
rm mycron

source ~/.bash_profile
