# Aliases
alias cd..="cd .."
alias h="history"
alias ls='ls -AFG'
alias ll='ls -l'
alias lnn='bulkSymLink'
alias lcat='cat "$1" | less'
alias mcat='cat "$1" | more'

# Functions
# Figure out how to rename/move a file in one folder without having to type path in second argument

function mkcd() {
  mkdir -p "$@" && cd "$@"
}

function bulkSymLink() {
  if [ -s "$2" ]; then
    OUT="$2"
  else
    OUT="."
  fi

  find "$1" -type f -depth 1 -exec ln -s {} $OUT \;
}

# General Environment Variables
PATH=$HOME/bin:$PATH

# Desktop PC
export PC_USER=ankit
export PC_HOST='192.168.1.113'
export PC_FTP_PORT=11321
export PC_MAC_ADDR='00:25:22:B4:33:92'

# Git
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gg='git log'
alias gl='git pull'
alias gp='git push'
alias gpom='git push origin master'
alias gs='git status'
alias gsub='git submodule update --init --recursive'

# Homebrew
#PATH=/usr/local/bin:$PATH

# Programming Languages and Platforms

# Android
export ANDROID_HOME=$HOME/adt-bundle-mac-x86_64
export ANDROID_SDK=$ANDROID_HOME/sdk
export ANDROID_NDK=$ANDROID_HOME/ndk
export ANDROID_TOOLCHAIN=$ANDROID_NDK
PATH=$ANDROID_SDK/platform-tools:$PATH
PATH=$ANDROID_SDK/tools:$PATH

# Node.js
#export NODE_PATH=/usr/local/lib/node_modules
PATH=/usr/local/share/npm/bin:$PATH

# Nodejitsu
alias jita='jitsu apps'
alias jitd='jitsu databases'
alias jite='jitsu env'
alias jitl='jitsu logs'

# Python
#[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
PATH=/usr/local/share/python:$PATH

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Maven
#export M2_HOME=/usr/local/Cellar/maven/3.0.4

export PATH
