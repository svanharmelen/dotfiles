export PS1="\u@macbook [ \w ] (\t)\n> "

export LANG=en_US.UTF-8
export GOPATH=$HOME/Documents/GoCode

alias ssh="ssh -A"
alias octave="octave-cli"

alias godir="cd $HOME/Documents/GoCode/src"
alias cookdir="cd $HOME/Documents/Cookbooks"
alias gitdir="cd $HOME/Documents/Git-Stuff"
alias mldir="cd $HOME/Documents/Git-Stuff/machine-learning"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

source <(kubectl completion bash)

function gocd ()
{ 
  cd `go list -f "{{.Dir}}" .../$1`
}
