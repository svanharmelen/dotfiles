# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

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
plugins=(autojump colorize docker docker-compose git github sudo terraform)

source $ZSH/oh-my-zsh.sh

# User configuration
setopt nonomatch
unsetopt share_history

# Set usefull aliasses
alias bu="brew update && brew upgrade && brew cleanup -s && brew prune && brew cask cleanup && brew cask outdated"
alias grep="pt"
alias pt="pt --nogroup --smart-case -e"
alias sn="export NVM_DIR=$HOME/.nvm && source /usr/local/opt/nvm/nvm.sh && nvm use"
alias ssh="ssh -A"
alias tf="terraform"
alias vi="nvim"
alias vim="nvim"

# Create an alias for hub->git
eval "$(hub alias -s)"

# Enable auto completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Tweak the way completions work
zstyle ':completion:*' insert-unambiguous true

# Enable shell command completion for gcloud
[ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ] && source "$HOME/.google-cloud-sdk/completion.zsh.inc"

# Enable support for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable rbenv
eval "$(rbenv init -)"

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

# Some logic to show execution times
_command_time_preexec() {
  timer=${timer:-$SECONDS}
}

_command_time_precmd() {
  if [ $timer ]; then
    elapsed=$(($SECONDS - $timer))
    if [ -n "$TTY" ] && [ $elapsed -ge 10 ]; then
      printf -v duration '%02d:%02d:%02d' $(($elapsed/3600)) $(($elapsed%3600/60)) $(($elapsed%60))
      RPROMPT="%F{cyan}(${duration}) %* %{$reset_color%}"
    fi
    unset timer
  fi
}

precmd_functions+=(_command_time_precmd)
preexec_functions+=(_command_time_preexec)

# Some logic to add a timestamp
RPROMPT="%F{cyan}%* %{$reset_color%}"
reset-prompt-and-accept-line() {
  zle reset-prompt
  zle accept-line
  RPROMPT="%F{cyan}%* %{$reset_color%}"
}

zle -N reset-prompt-and-accept-line

bindkey '^m' reset-prompt-and-accept-line
