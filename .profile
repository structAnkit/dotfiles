# Aliases
alias cd..="cd .."
alias h="history"
alias ls='ls -FG'
alias ll='ls -lA'
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

# Desktop PC
export PC_USER=ankit
export PC_HOST='192.168.1.113'
export PC_FTP_PORT=11321
export PC_MAC_ADDR='00:25:22:B4:33:92'

# Git
alias gs='git show'
alias gcc!='git commit -C HEAD --amend'
alias gclo='git clone'
alias gsub='git submodule update --init --recursive'

# Spotify-specific
alias gpor='git push origin HEAD:refs/for/master'
alias spcid='sp_changeId $1'
alias nospcid='sp_delChangeId $1'
function sp_changeId() {
  if [ -s "$1" ]; then
    MODULE="modules/$1"
  fi

  scp git.spotify.net:hooks/commit-msg .git/${MODULE}/hooks/
}
function sp_delChangeId() {
  if [ -s "$1" ]; then
    MODULE="modules/$1"
  fi

  rm -rf .git/${MODULE}/hooks/*
}

# GitHub
alias ghnew='github_new_repo'

function github_new_repo() {
  GITHUB_USERNAME=`git config --global github.user`

  CURRENT_DIRNAME=${PWD##*/}
  REPO_NAME=${1:-$CURRENT_DIRNAME}

  echo "Creating GitHub repo: $GITHUB_USERNAME/$REPO_NAME"
  curl -u "$GITHUB_USERNAME" https://api.github.com/user/repos -d "{\"name\": \"$REPO_NAME\"}"
  git init && git remote add origin git@github.com:$GITHUB_USERNAME/$REPO_NAME.git
}

# Homebrew
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH


# Programming Languages and Platforms

# Android
#export ANDROID_HOME=$HOME/adt-bundle-mac-x86_64
export ANDROID_STUDIO=/Applications/Android\ Studio.app
export ANDROID_HOME=$HOME/android
export ANDROID_SDK=$ANDROID_HOME/sdk
PATH=$ANDROID_SDK/platform-tools:$PATH
PATH=$ANDROID_SDK/tools:$PATH

export ANDROID_NDK=$ANDROID_HOME/ndk
export ANDROID_TOOLCHAIN=$ANDROID_NDK/toolchains/sp-arm-linux-androideabi-4.6

# Node.js
#export NODE_PATH=/usr/local/lib/node_modules
PATH=/usr/local/share/npm/bin:$PATH

# Nodejitsu
alias jita='jitsu apps'
alias jitd='jitsu databases'
alias jite='jitsu env'
alias jitl='jitsu logs'

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

# Python
#[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Maven
#export M2_HOME=/usr/local/Cellar/maven/3.0.4

export PATH

