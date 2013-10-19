if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
