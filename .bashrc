if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
