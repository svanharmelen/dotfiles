# Define environment variables

# Set my prefered editor.
export EDITOR=nvim

# Configure j as z command.
export _Z_CMD=j
export FZ_CMD=j
export FZ_SUBDIR_CMD=jj

# Options to fzf command.
export FZF_DEFAULT_OPTS='--height=40% --reverse -e'
export FZF_LEGACY_KEYBINDINGS=0

# Set the language and make sure we use UTF-8.
export LANG=en_US.UTF-8

# Set some default paths.
export PATH="/usr/local/sbin:$HOME/go/bin:$HOME/.cargo/bin:$PATH"

# Source my Github username and token variables.
export $(/usr/local/bin/envchain -l github -v)

# Source my Jira username and token variables.
export $(/usr/local/bin/envchain -l jira -v)
