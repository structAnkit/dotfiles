# Aliases
alias cd..="cd .."
alias h="history"
alias ls='ls -FG'
alias ll='ls -lA'
alias lnn='bulkSymLink'
alias json="python -mjson.tool | pygmentize -ljson"
alias xml="xmllint --format - | pygmentize -lxml"

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

# Git
alias gs='git show'
alias gcc!='git commit -C HEAD --amend'
alias gclo='git clone'
alias gsub='git submodule update --init --recursive'

# Spotify-specific
# GitHub
alias ghenew='ghe_new_repo'
function ghe_new_repo() {
  GITHUB_HOST='ghe.spotify.net'
  GITHUB_API_HOST="https://$GITHUB_HOST/api/v3"
  CREATE_USER_REPO_LINK="$GITHUB_API_HOST/user/repos"
  CREATE_ORG_REPO_LINK="$GITHUB_API_HOST/orgs/ORG_NAME/repos"

  CURRENT_USERNAME=`git config --global ghe.user`
  OAUTH_TOKEN=`git config --global ghe.token`

  CURRENT_DIRNAME=${PWD##*/}

  if [ -z "$2" ]; then
    CREATE_REPO_LINK=$CREATE_USER_REPO_LINK
    REPO_USERNAME=$CURRENT_USERNAME
    REPO_NAME=${1:-$CURRENT_DIRNAME}
  else
    ORG_NAME=$1
    CREATE_REPO_LINK=${CREATE_ORG_REPO_LINK/ORG_NAME/$ORG_NAME}
    REPO_USERNAME=$ORG_NAME
    REPO_NAME=${2:-$CURRENT_DIRNAME}
  fi

  curl -H "Authorization: token $OAUTH_TOKEN" "$CREATE_REPO_LINK" -d "{\"name\": \"$REPO_NAME\"}"
  git init && git remote add origin git@$GITHUB_HOST:$REPO_USERNAME/$REPO_NAME.git
}

alias ghnew='github_new_repo'
function github_new_repo() {
  GITHUB_HOST='github.com'
  GITHUB_API_PATH="api.$GITHUB_HOST"
  CREATE_USER_REPO_LINK="https://$GITHUB_API_PATH/user/repos"
  CREATE_ORG_REPO_LINK="https://$GITHUB_API_PATH/orgs/ORG_NAME/repos"

  CURRENT_USERNAME=`git config --global github.user`
  OAUTH_TOKEN=`git config --global github.token`

  CURRENT_DIRNAME=${PWD##*/}

  if [ -z "$2" ]; then
    CREATE_REPO_LINK=$CREATE_USER_REPO_LINK
    REPO_USERNAME=$CURRENT_USERNAME
    REPO_NAME=${1:-$CURRENT_DIRNAME}
  else
    ORG_NAME=$1
    CREATE_REPO_LINK=${CREATE_ORG_REPO_LINK/ORG_NAME/$ORG_NAME}
    REPO_USERNAME=$ORG_NAME
    REPO_NAME=${2:-$CURRENT_DIRNAME}
  fi

  curl -H "Authorization: token $OAUTH_TOKEN" "$CREATE_REPO_LINK" -d "{\"name\": \"$REPO_NAME\"}"
  git init && git remote add origin git@$GITHUB_HOST:$REPO_USERNAME/$REPO_NAME.git
}

# Homebrew
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH


# Programming Languages and Platforms

# Android
export ANDROID_NDK=/Users/ankit/android-ndk
export ANDROID_HOME=/Applications/Android\ Studio.app/sdk
PATH=$ANDROID_HOME/platform-tools:$PATH
PATH=$ANDROID_HOME/tools:$PATH

# Node.js
PATH=/usr/local/share/npm/bin:$PATH

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Docker
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375

# Ruby
export GEM_HOME=$HOME/.gem
PATH=$GEM_HOME/bin:$PATH

export PATH

