#!/bin/bash

# User binaries
mkdir $HOME/bin


## Utilities

# Google Chrome
open -g "http://www.google.com/chrome"

# Alfred
open -g "https://www.alfredapp.com"

# Source Code Pro
open -g "https://github.com/adobe-fonts/source-code-pro/releases"

# iTerm 2
open -g "https://iterm2.com/downloads.html"

# 1Password
open -g "https://1password.com/downloads"

# Dropbox
open "https://www.dropbox.com/downloading?os=mac"
mkdir -p $HOME/dev
DROPBOX_DIR="$HOME/Dropbox"
ln -s "$DROPBOX_DIR/Development" "$HOME/dev/personal"

read -s -p "Install Dropbox then press ENTER to continue..."


## Design Tools

# Sketch
open -g "https://sketchapp.com/"

# Principle
open -g "http://principleformac.com"

# Origami Studio
open -g "http://origami.design"


## Development Tools

# VS Code
open -g "https://code.visualstudio.com/docs/?dv=osx"

# Atom
open -g "https://atom.io"

# Dash
open -g "https://kapeli.com/dash"

# VIM Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Xcode Command Line Tools
xcode-select --install
read -s -p "Install Xcode command line tools then press ENTER to continue..."

# Xcode
read -s -p "Install Xcode via App Store then press ENTER to continue..."

# Remove repeat-blocking for IDEs
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false


## Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew doctor

read -s -p "Fix any errors with Homebrew then press ENTER to continue..."

# Git / Hub
brew install git hub gpg

# Languages/Platforms/SDKs

# Node.js
brew install node
npm install -g jshint grunt-cli

# JSON Processor
brew install jq

# Miscellaneous
brew install ack autojump watch docker gpg

# Python
brew install python
pip install --upgrade pip setuptools wheel
pip install --upgrade tw2.pygmentize
pip install --upgrade virtualenv virtualenvwrapper
pip install --upgrade pyopenssl


## Shells

# Bash
brew install bash

# ZSH
brew install --without-etcdir zsh
source $HOME/.zshrc

# Oh My ZSH
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Replace dotfiles
zsh
DOT_DIR=$HOME/dotfiles
git clone https://github.com/structAnkit/dotfiles.git $DOT_DIR
rm -rf $HOME/.profile $HOME/.bash_profile $HOME/.bashrc $HOME/.inputrc $HOME/.zshrc $HOME/.vimrc $HOME/.xvimrc $HOME/.gitconfig $HOME/.jshintrc $HOME/.atom
#find "$DOT_DIR/\.*" -d 0 -type f -exec ln -s {} . \;
ln -s "$DOT_DIR"/\.* "$HOME"/
rm -rf "$HOME"/.git

echo "Add your new shells to /etc/shells"
echo "i.e. /usr/local/bin/zsh, /usr/local/bin/bash"
sudo vim /etc/shells
