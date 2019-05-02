# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Fuzzy z completions
# ------------
source "/Users/svanharmelen/dotfiles/plugins/fz.plugin.zsh"

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
