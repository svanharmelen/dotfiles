# Define colors
red='\[\e[0;31m\]'
yellow='\[\e[0;33m\]'
reset='\[\e[0m\]'

# Add git branch info to the prompt
parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'; }
export PS1="\u@macbook [${yellow}\w${reset}]${red}\$(parse_git_branch)${reset} \t\n> "

export LANG=en_US.UTF-8
export GOPATH=$HOME/Documents/GoCode

# Set usefull aliasses
alias ssh="ssh -A"
alias octave="octave-cli"
alias grep="pt"
alias pt="pt --nogroup --smart-case -e"
alias connect="sudo openconnect --cafile=$HOME/workspace/sbp.pem --user=$(whoami) \
  -c \`p11tool --list-all-certs --only-urls pkcs11:model=eToken\`  \
  --authgroup=4.PKI-extern_With_Office mcinfravpn.schubergphilis.com -b"

# Enable auto jump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Enable bash completion
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
