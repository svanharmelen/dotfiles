# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/svanharmelen/dotfiles/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump git knife sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8
export GOPATH=$HOME/Documents/GoCode

# Set usefull aliasses
alias vi="nvim"
alias vim="nvim"
alias ssh="ssh -A"
alias octave="octave-cli"
alias grep="pt"
alias pt="pt --nogroup --smart-case -e"
alias connect="sudo openconnect --cafile=$HOME/workspace/sbp.pem --user=$(whoami) \
  -c \`p11tool --list-all-certs --only-urls pkcs11:model=eToken\`  \
  --authgroup=4.PKI-extern_With_Office mcinfravpn.schubergphilis.com -b"

# Some knife aliasses
alias kcu="knife cookbook upload"
alias kou="knife cookbook upload -o ../ $(basename `pwd`)"

# Enable auto completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Enable support for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom function to prevent nvim in nvim sessions
function nvim () {
  if [[ -z $NVIM_LISTEN_ADDRESS ]]; then
    command nvim $argv
  else
    if [[ -z $argv ]]; then
      nvr --remote-wait
    else
      nvr $argv
    fi
  fi
}