#!/bin/sh

# User binaries
mkdir $HOME/bin

# Google Chrome
open "http://www.google.com/chrome"
read -s -p "Install Google Chrome first then press ENTER to continue..."
CHROME_DIR="/Applications/Google Chrome.app"

# Source Code Pro
open -a "$CHROME_DIR" -g "http://sourceforge.net/projects/sourcecodepro.adobe/files/latest/download"

# iTerm 2
open -a "$CHROME_DIR" "http://code.google.com/p/iterm2/downloads/list"

# Alfred
open -a "$CHROME_DIR" "http://www.alfredapp.com/#download-alfred"

# Dropbox
open -a "$CHROME_DIR" -g "https://www.dropbox.com/downloading?os=mac"
mkdir -p $HOME/dev
ln -s "$HOME/Dropbox/Development" "$HOME/dev/personal"

# Sublime Text 3
open -a "$CHROME_DIR" "http://www.sublimetext.com/3dev"
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "$HOME/bin/subl"

read -s -p "Install Dropbox and Sublime Text then press ENTER to continue..."

# Remove repeat-blocking for IDEs
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false

DB_ST_DIR="$DROPBOX_DIR/AppData/Sublime Text 3"
ST_DIR="$HOME/Library/Application Support/Sublime Text 3"
mkdir -p "$ST_DIR/Packages" "$ST_DIR/Local"
ln -s "$DB_ST_DIR/Packages/User" "$ST_DIR/Packages/User"
ln -s "$DB_ST_DIR/Local/License.sublime_license" "$ST_DIR/Local/License.sublime_license"
curl http://sublime.wbond.net/Package%20Control.sublime-package -o "$ST_DIR"/Installed\ Packages/Package\ Control.sublime-package

read -s -p "Install Xcode via App Store then press ENTER to continue..."

# Alcatraz for Xcode
curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

# Xcode Command Line Tools
xcode-select --install

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
brew install ack autojump watch hub docker gradle

# Python
brew install python
pip install --upgrade setuptools pip
pip install --upgrade tw2.pygmentize
pip install --upgrade pyopenssl
pip install --upgrade virtualenv virtualenvwrapper

# Python3
brew install python3
pip3 install --upgrade setuptools pip
pip3 install --upgrade tw2.pygmentize
pip3 install --upgrade pyopenssl
pip3 install --upgrade virtualenv virtualenvwrapper
