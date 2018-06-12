# Define environment variables

# Set the language and make sure we use UTF-8
export LANG=en_US.UTF-8

# Set some default paths
export GOPATH="$HOME/GoCode"
export PATH="$GOPATH/bin:$HOME/.google-cloud-sdk/bin:$HOME/.rbenv/shims:$PATH"

# Only set EDITOR if it doesn't exist. This check is needed
# because in an nvim terminal we overwrite this variable
if [[ -z $EDITOR ]]; then
  export EDITOR=nvim
fi
