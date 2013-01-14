# Aliases
alias cd..="cd .."
alias h="history"
alias ls='ls -AFG'
alias ll='ls -l'
alias lnn='bulkSymLink'
alias mcat='cat "$1" | more'
alias mkcd='mkdir "$1" && cd "$1"'

# Functions
# Figure out how to rename/move a file in one folder without having to type path in second argument
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
alias gcl='git clone'
alias gc='git commit'
alias gca='git commit --ammend'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gpom='git push origin master'
alias gl='git pull'
alias glom='git pull origin master'

# Homebrew
#PATH=/usr/local/bin:$PATH

# Programming Languages and Platforms

# Android
export ANDROID_SDK_HOME=$HOME/adt-bundle-mac-x86_64/sdk
PATH=$ANDROID_SDK_HOME/platform-tools:$PATH
PATH=$ANDROID_SDK_HOME/tools:$PATH

# Node.js
#export NODE_PATH=/usr/local/lib/node_modules
PATH=/usr/local/share/npm/bin:$PATH

# Nodejitsu
alias jita='jitsu apps'
alias jitd='jitsu databases'
alias jite='jitsu env'
alias jitl='jitsu logs'

# Python
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Maven
#export M2_HOME=/usr/local/Cellar/maven/3.0.4

export PATH
