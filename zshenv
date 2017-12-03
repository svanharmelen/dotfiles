# Define environment variables

# Set the language and make sure we use UTF-8
export LANG=en_US.UTF-8

# Set some default paths
export GOPATH="$HOME/Documents/GoCode"
export PATH="$PATH:$GOPATH/bin:/usr/local/google-cloud-sdk/bin"

# Only set EDITOR if it doesn't exist. This check is needed
# because in an nvim terminal we overwrite this variable
if [[ -z $EDITOR ]]; then
  export EDITOR=nvim
fi
