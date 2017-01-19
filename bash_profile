red='\[\e[0;31m\]'
yellow='\[\e[0;33m\]'
reset='\[\e[0m\]'

parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'; }
export PS1="\u@macbook [${yellow}\w${reset}]${red}\$(parse_git_branch)${reset} \t\n> "

export LANG=en_US.UTF-8
export GOPATH=$HOME/Documents/GoCode

alias ssh="ssh -A"
alias octave="octave-cli"

alias godir="cd $HOME/Documents/GoCode/src"
alias cookdir="cd $HOME/Documents/Cookbooks"
alias gitdir="cd $HOME/Documents/Git-Stuff"
alias mldir="cd $HOME/Documents/Git-Stuff/machine-learning"

# Enable bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Source docker completion
#source ~/dotfiles/docker-completion.bash

# Source kubectl completion
#source <(kubectl completion bash)

# Source git completion
source ~/dotfiles/git-completion.bash

# A nice helper function to cd into Go packages
function gocd ()
{
  cd `go list -f "{{.Dir}}" .../$1 | awk '{ print length($0) " " $0; }' $file | sort -n | cut -d' ' -f2 | head -1`
}
