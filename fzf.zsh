# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

