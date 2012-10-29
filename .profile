# Aliases
alias cd..="cd .."
alias h="history"
alias ls='ls -AFG'
alias ll='ls -l'
alias lnn='bulkSymLink'

# Functions
function bulkSymLink() {
  if [ -s "$2" ]; then
    OUT="$2"
  else
    OUT="."
  fi

  find "$1" -type f -depth 1 -exec ln -s {} $OUT \;
}

# General Environment Variables
PATH=$PATH:$HOME/bin

# Desktop PC
export PC_USER=ankit
export PC_HOST='192.168.1.113'
export PC_FTP_PORT=11321
export PC_MAC_ADDR='00:25:22:B4:33:92'

# Git
alias gcl='git clone'
alias gc='git commit -m'
alias gca='git commit -am'
alias gs='git status'
alias gp='git push'
alias gpom='git push origin master'
alias gl='git pull'
alias glom='git pull origin master'


# Programming Languages and Platforms

# Android
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r20.0.3
export ANDROID_SDK_HOME=$ANDROID_SDK_ROOT
PATH=$ANDROID_SDK_HOME/platform-tools:$PATH
PATH=$ANDROID_SDK_HOME/tools:$PATH

# Node.js
#export NODE_PATH="/usr/local/lib/node_modules"
PATH=/usr/local/share/npm/bin:$PATH

# Python
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Maven
#export M2_HOME=/usr/local/Cellar/maven/3.0.4

export PATH
