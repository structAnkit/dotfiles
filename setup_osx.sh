#!/bin/sh

# User binaries
mkdir $HOME/bin

# Google Chrome
open "http://www.google.com/chrome"
read -s -p "Install Google Chrome first then press ENTER to continue..."

# Dropbox
open -a Chrome -g "https://www.dropbox.com/downloading?os=mac"

# Source Code Pro
open -a Chrome -g "http://sourceforge.net/projects/sourcecodepro.adobe/files/latest/download"

# XVIM for Xcode
open -a Chrome "http://programming.jugglershu.net/xvim"

# Sublime Text 2
open -a Chrome "http://www.sublimetext.com/nightly"
# Remove repeat-blocking
defaults write -g ApplePressAndHoldEnabled -bool false

read -s -p "Install Dropbox and Sublime Text 2 first then press ENTER to continue..."

ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" $HOME/bin/subl
ln -s $DROPBOX_DIR/Development $HOME/dev

DROPBOX_DIR="$HOME/Dropbox"
DD_ST2_DIR="$DROPBOX_DIR/AppData/Sublime Text 2"
ST2_DIR="$HOME/Library/Application Support/Sublime Text 2"
ls "$DD_ST2_DIR/Packages/User"
rm -rf "$DD_ST2_DIR/Packages/User"
ln -s "$DD_ST2_DIR/Packages/User" "$ST2_DIR/Packages/User"
cp "$DD_ST2_DIR/Settings/License.sublime_license" "$ST2_DIR/Settings/License.sublime_license"
curl http://sublime.wbond.net/Package%20Control.sublime-package -o "$ST2_DIR/Installed Packages/Package Control.sublime-package"

# Homebrew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew doctor

read -s -p "Fix any errors with brew then press ENTER to continue..."

# Git
brew install git

# Copy dotfiles
DOT_DIR=$HOME/dotfiles
git clone git://github.com/structAnkit/dotfiles.git $DOT_DIR
rm -rf $HOME/.profile $HOME/.bash_profile $HOME/.bashrc $HOME/.zshrc $HOME/.vimrc $HOME/.xvimrc $HOME/.gitconfig $HOME/.jshintrc
find "$DOT_DIR/\.*" -d 0 -type f -exec ln -s {} . \;

# ZSH
brew install zsh

## Oh My ZSH
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Add your new shells to /etc/shells"
echo "i.e. /usr/local/bin/bash, /usr/local/bin/zsh"
sudo vim /etc/shells

# Languages/Platforms/SDKs
# Next line is to install Automake/AutoConf/GCC4.2 for RVM
brew tap homebrew/dupes
brew install android node dart maven go autoconf automake apple-gcc42

# Node.js
npm update -g
npm install -g express jshint node-dev coffee-script grunt

# PyBrew
curl -kL "http://xrl.us/pythonbrewinstall" | bash

# RVM
curl -L "https://get.rvm.io" | bash -s stable --ruby

# Miscellaneous
brew install ack watch bash
gem install wol compass sass
