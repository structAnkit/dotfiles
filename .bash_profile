# Aliases
alias cd..="cd .."
alias h="history"
alias ls='ls -AFG'
alias ll='ls -l'

# Functions


# General Environment Variables
PATH=$HOME/bin:$PATH

# Desktop PC
export PC_USER=ankit
export PC_HOST='192.168.1.113'
export PC_FTP_PORT=11321
export PC_MAC_ADDR='00:25:22:B4:33:92'

# Sublime Text 2
# Remove repeat-blocking
defaults write -g ApplePressAndHoldEnabled -bool false

# MacVim
export VIM_APP_DIR=/Applications
#export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
#export LESSEDIT='mvim'

# Homebrew
PATH=/usr/local/bin:$PATH

# Git
git config --global core.editor "subl -w"

# Android
export ANDROID_SDK_HOME=/Android
PATH=$ANDROID_SDK_HOME/platform-tools:$PATH
PATH=$ANDROID_SDK_HOME/tools:$PATH


# Programming Languages and Platforms
# Node.js
export NODE_PATH='/usr/local/lib/node_modules'

# Python
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Maven
#export M2_HOME=/usr/local/Cellar/maven/3.0.4


# Databases
# MongoDB
PATH=$HOME/mongodb/bin:$PATH

# MySQL
export MYSQL_CONFIG=/usr/local/mysql/bin/mysql_config

export PATH

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
