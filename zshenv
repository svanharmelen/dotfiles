# Define environment variables

# Set the language and make sure we use UTF-8
export LANG=en_US.UTF-8

# Set some default paths
export GOPATH="$HOME/GoCode"
export PATH="$GOPATH/bin:$HOME/.google-cloud-sdk/bin:$HOME/.rbenv/shims:/usr/local/opt/postgresql@9.6/bin:$PATH"

# Set the Github username and token variables.
export $(/usr/local/bin/envchain -l github -v)

# Only set EDITOR if it doesn't exist. This check is needed
# because in an nvim terminal we overwrite this variable
if [[ -z $EDITOR ]]; then
  export EDITOR=nvim
fi
