#!/bin/sh

# User binaries
mkdir $HOME/bin

# Google Chrome
open "http://www.google.com/chrome"
read -s -p "Install Google Chrome first then press ENTER to continue..."
CHROME_DIR="/Applications/Google Chrome.app"

# Dropbox
open -a "$CHROME_DIR" -g "https://www.dropbox.com/downloading?os=mac"
ln -s "$HOME/Dropbox/Development" "$HOME/dev"

# Source Code Pro
open -a "$CHROME_DIR" -g "http://sourceforge.net/projects/sourcecodepro.adobe/files/latest/download"

# XVIM for Xcode
open -a "$CHROME_DIR" "http://programming.jugglershu.net/xvim"

# iTerm 2
open -a "$CHROME_DIR" "http://code.google.com/p/iterm2/downloads/list"

# Alfred
open -a "$CHROME_DIR" "http://www.alfredapp.com/#download-alfred"

# Sublime Text 2
open -a "$CHROME_DIR" "http://www.sublimetext.com/nightly"
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" $HOME/bin/subl
# Remove repeat-blocking
defaults write -g ApplePressAndHoldEnabled -bool false


read -s -p "Install Dropbox and Sublime Text 2 first then press ENTER to continue..."

DD_ST2_DIR="$DROPBOX_DIR/AppData/Sublime Text 2"
ST2_DIR="$HOME/Library/Application Support/Sublime Text 2"
mkdir -p "$ST2_DIR" "$ST2_DIR"/Installed\ Packages "$ST2_DIR/Packages" "$ST2_DIR/Settings"
ln -s "$DD_ST2_DIR/Packages/User" "$ST2_DIR/Packages/User"
cp "$DD_ST2_DIR/Settings/License.sublime_license" "$ST2_DIR/Settings/License.sublime_license"
curl http://sublime.wbond.net/Package%20Control.sublime-package -o "$ST2_DIR"/Installed\ Packages/Package\ Control.sublime-package"

# Homebrew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew update
brew doctor

read -s -p "Fix any errors with brew then press ENTER to continue..."

# Git
brew install git

# ZSH
brew install --disable-etcdir zsh

## Oh My ZSH
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Add your new shells to /etc/shells"
echo "i.e. /usr/local/bin/bash, /usr/local/bin/zsh"
sudo vim /etc/shells

# Languages/Platforms/SDKs
# Next line is to install Automake/AutoConf/GCC4.2 for RVM
brew tap homebrew/dupes
brew install cmake autoconf automake apple-gcc42 node android maven

# Node.js
npm install -g express jshint node-dev coffee-script grunt
npm search

# PyBrew
curl -kL "http://xrl.us/pythonbrewinstall" | bash

# RVM
curl -L "https://get.rvm.io" | bash -s stable --ruby

# Miscellaneous
gem install wol compass sass
brew install ack watch bash dart go rust

# Replace dotfiles
DOT_DIR=$HOME/dotfiles
git clone git://github.com/structAnkit/dotfiles.git $DOT_DIR
rm -rf $HOME/.profile $HOME/.bash_profile $HOME/.bashrc $HOME/.zshrc $HOME/.vimrc $HOME/.xvimrc $HOME/.gitconfig $HOME/.jshintrc
zsh
#find "$DOT_DIR/\.*" -d 0 -type f -exec ln -s {} . \;
ln -s "$DOT_DIR"/\.* "$HOME"/
rm -rf "$HOME"/.git

