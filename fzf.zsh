# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/sander/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/sander/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/sander/.fzf/shell/completion.zsh" 2> /dev/null

# Fuzzy z completions
# ------------
source "/Users/sander/dotfiles/plugins/fz.plugin.zsh"

# Interactive completions
# ------------
source "/Users/sander/dotfiles/plugins/zsh-interactive-cd.plugin.zsh"

# Key bindings
# ------------
source "/Users/sander/.fzf/shell/key-bindings.zsh"
