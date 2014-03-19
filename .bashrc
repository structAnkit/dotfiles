# Autojump
[[ -s `brew --prefix`/etc/autojump.bash ]] && . `brew --prefix`/etc/autojump.bash

if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi
