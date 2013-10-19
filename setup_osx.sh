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
open -a "$CHROME_DIR" "https://github.com/jugglershu/xvim"

# iTerm 2
open -a "$CHROME_DIR" "http://code.google.com/p/iterm2/downloads/list"

# Alfred
open -a "$CHROME_DIR" "http://www.alfredapp.com/#download-alfred"

# Remove repeat-blocking for Sublime Text
defaults write -g ApplePressAndHoldEnabled -bool false

# Sublime Text 3
open -a "$CHROME_DIR" "http://www.sublimetext.com/3dev"
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "$HOME/bin/subl"

read -s -p "Install Dropbox and Sublime Text then press ENTER to continue..."

DB_ST_DIR="$DROPBOX_DIR/AppData/Sublime Text 3"
ST_DIR="$HOME/Library/Application Support/Sublime Text 3"
mkdir -p "$ST_DIR/Packages" "$ST_DIR/Local"
ln -s "$DB_ST_DIR/Packages/User" "$ST_DIR/Packages/User"
ln -s "$DB_ST_DIR/Local/License.sublime_license" "$ST_DIR/Local/License.sublime_license"
curl http://sublime.wbond.net/Package%20Control.sublime-package -o "$ST_DIR"/Installed\ Packages/Package\ Control.sublime-package

# Homebrew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew update
brew doctor

read -s -p "Fix any errors with brew then press ENTER to continue..."

# Git
brew install git

# Replace dotfiles
DOT_DIR=$HOME/dotfiles
git clone git://github.com/structAnkit/dotfiles.git $DOT_DIR
rm -rf $HOME/.profile $HOME/.bash_profile $HOME/.bashrc $HOME/.zshrc $HOME/.vimrc $HOME/.xvimrc $HOME/.gitconfig $HOME/.jshintrc
zsh
#find "$DOT_DIR/\.*" -d 0 -type f -exec ln -s {} . \;
ln -s "$DOT_DIR"/\.* "$HOME"/
rm -rf "$HOME"/.git

# ZSH
brew install --disable-etcdir zsh
source $HOME/.zshrc

# Oh My ZSH
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Add your new shells to /etc/shells"
echo "i.e. /usr/local/bin/bash, /usr/local/bin/zsh"
sudo vim /etc/shells

# Languages/Platforms/SDKs

# Various C/C++ Utilities
brew install cmake autoconf automake

# Node.js
brew install node
npm install -g express jshint grunt-cli jitsu

# Miscellaneous
brew install ack watch

# Java
brew install maven

# Python
brew install python
pip install --upgrade distribute
pip install virtualenv virtualenvwrapper
pip install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz

# Python3
brew install python3
pip3 install --upgrade distribute
pip3 install virtualenv virtualenvwrapper
#pip3 install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz

# RVM
curl -L "https://get.rvm.io" | bash -s stable --ruby
gem install compass sass
