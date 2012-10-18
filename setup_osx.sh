#!/bin/sh
# Google Chrome
open "http://www.google.com/chrome"

# Dropbox
open "https://www.dropbox.com/downloading?os=mac"

# Xcode
open "http://programming.jugglershu.net/xvim"

# Sublime Text 2
# Remove repeat-blocking
defaults write -g ApplePressAndHoldEnabled -bool false

open "http://www.sublimetext.com/nightly"

echo "Install Sublime Text 2 first then press ENTER to continue..."
read -s

echo "Add your new shells to /etc/shells"
echo "i.e. /usr/local/bin/bash, /usr/local/bin/zsh"
sudo vim /etc/shells

DROPBOX_DIR="$HOME/Dropbox"
DD_ST2_DIR="$DROPBOX_DIR/AppData/Sublime Text 2"
ST2_DIR="$HOME/Library/Application Support/Sublime Text 2"
rm -rf "$ST2_DIR/Installed Packages" "$ST2_DIR/Packages" "$ST2_DIR/Pristine Packages"
ln -s "$DD_ST2_DIR/Installed Packages" "$ST2_DIR/Installed Packages"
ln -s "$DD_ST2_DIR/Packages" "$ST2_DIR/Packages"
ln -s "$DD_ST2_DIR/Pristine Packages" "$ST2_DIR/Pristine Packages"

# User bin
mkdir $HOME/bin
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" $HOME/bin/subl

# Set dev symlinks
ln -s $DROPBOX_DIR/Development $HOME/dev

# Homebrew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

# Git
brew install git

# Copy dotfiles
DOT_DIR=$HOME/dotfiles
git clone git://github.com/structAnkit/dotfiles.git $DOT_DIR
rm -rf $HOME/.profile
rm -rf $HOME/.bashrc
rm -rf $HOME/.bash_profile
ln -s $DOT_DIR/.profile $HOME/.profile
ln -s $DOT_DIR/.bashrc $HOME/.bashrc
ln -s $DOT_DIR/.bashrc $HOME/.bash_profile
ln -s $DOT_DIR/.gitconfig $HOME/.gitconfig
ln -s $DOT_DIR/.jshintrc $HOME/.jshintrc

# ZSH
brew install zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
rm -rf $HOME/.zshrc
ln -s $DOT_DIR/.zshrc $HOME/.zshrc

# Android
brew install android

# Node.js
brew install node
npm update -g
npm install -g express jshint node-dev coffee-script

# Dart
npm install -g Frog
brew install dart

# PyBrew
curl -kL "http://xrl.us/pythonbrewinstall" | bash

# Maven
brew install maven

# Go
brew install go

# Bash
brew install bash

# RVM
brew tap homebrew/dupes
brew install autoconf automake apple-gcc42
curl -L "https://get.rvm.io" | bash -s stable --ruby

# Utilities
brew install ack watch
gem install wol compass sass
