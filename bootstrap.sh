#!/bin/bash

brew install bash

# Add the brew bash shell to the list of allowed shells and set as default
BREW_PREFIX=$(brew --prefix)
sudo bash -c "echo ${BREW_PREFIX}/bin/bash >> /etc/shells"
chsh -s "${BREW_PREFIX}/bin/bash"

brew tap chrokh/tap
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install asdf
brew install bash-completion@2
brew install cmake
brew install coreutils
brew install curl
brew install docker-completion
brew install docker-compose-completion
brew install fd
brew install findutils
brew install fzf
brew install gawk
brew install git
brew install gnu-sed
brew install htop
brew install moreutils
brew install ripgrep
brew install tmux
brew install vim
brew install wget
brew install z

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

source ~/.bash_profile

# asdf
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add python https://github.com/asdf-community/asdf-python.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git

# install latest versions and set as global
for plugin in nodejs golang ruby python erlang elixir; do
  latest=$(asdf latest "$plugin")
  asdf install "$plugin" "$latest"
  asdf set -u "$plugin" "$latest"
done
