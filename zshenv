# Define environment variables

# Set the language and make sure we use UTF-8
export LANG=en_US.UTF-8

# Set some default paths
export GOPATH="$HOME/GoCode"
export PATH="/usr/local/sbin:$GOPATH/bin:$PATH"

# Set Go related variables.
export GOBIN="$GOPATH/bin"
export GO111MODULE=on

# Set the Github username and token variables.
export $(/usr/local/bin/envchain -l github -v)

# Use .. as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='..'

# Options to fzf command
export FZF_DEFAULT_OPTS='--height=40% --reverse -e'
export FZF_CTRL_R_OPTS='--layout=default'

# Only set EDITOR if it doesn't exist. This check is needed
# because in an nvim terminal we overwrite this variable
if [[ -z $EDITOR ]]; then
  export EDITOR=nvim
fi
