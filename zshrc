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
plugins=(colorize docker docker-compose git kubectl terraform)

source $ZSH/oh-my-zsh.sh

# Change into my working directory
if [[ "$PWD" == "$HOME" ]]; then
  cd ~/workspace
fi

# User configuration
setopt nonomatch
setopt rmstarsilent
unsetopt share_history

# Set usefull aliasses
alias bu="brew update && brew upgrade && brew cask upgrade && brew cleanup -s"
alias c="cargo"
alias grep="ag --nogroup --color-match='1;31'"
alias nu="nvim +PlugUpdate +PlugUpgrade +UpdateRemotePlugins"
alias pip="pip3"
alias python=python3
alias ssh="ssh -A"
alias tf="terraform"
alias vi="nvim"
alias vim="nvim"

# Some additional git aliasses
alias git="hub"
alias gpsupr="gpsup && hub pull-request"
alias gpr="hub pull-request"
alias gt="git tag"
alias gdt="git difftool"
alias gfal="gfa && gl"

# Aliases to activate virual environments
# python -m venv --copies ~/Python/xxxxxx
alias pp="source ~/Python/preprocess/bin/activate"
alias ss="source ~/Python/scrapy/bin/activate"

# Enable auto completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Tweak the way completions work
zstyle ':completion:*' insert-unambiguous true

# Enable support for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^P' fzf-file-widget

# Enable rbenv
eval "$(rbenv init -)"

# Enable support for z (and use j as z cmd)
_Z_CMD=j
FZ_CMD=j
FZ_SUBDIR_CMD=jj
[ -f /usr/local/etc/profile.d/z.sh ] && source /usr/local/etc/profile.d/z.sh

newline=$'\n'
ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status}%{$fg[cyan]%}%~%{$reset_color%} $(aws_prompt_info)$(git_prompt_info)${newline}${ret_status}%{$reset_color%}'
eval orange='$FG[214]'

# Show which AWS profile is used
aws_prompt_info() {
  if [[ -n $AWS_OKTA_PROFILE ]]; then
    echo "%{$fg_bold[blue]%}aws:(%{$orange%}$AWS_OKTA_PROFILE%{$fg[blue]%})%{$reset_color%} "
  fi
}

# Easily switch between AWS roles
ao() {
  local cmd="aws-okta list | awk 'FNR==1 {next} {print \$1}'"
  local profile="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height 40% --reverse" fzf)"
  if [[ -n $profile ]]; then
    source <(aws-okta env "$profile")
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
