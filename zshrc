# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set to this to use case-sensitive completion.
CASE_SENSITIVE="true"

# Set whether to disable fzf auto-completion.
DISABLE_FZF_AUTO_COMPLETION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Suppress warning for insecure completion-dependent directories.
ZSH_DISABLE_COMPFIX="true"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# git clone https://github.com/changyuheng/fz $ZSH_CUSTOM/plugins/fz
# git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
plugins=(git docker z fz fzf fzf-tab kubectl terraform)

source $ZSH/oh-my-zsh.sh

# Change into my working directory.
if [[ "$PWD" == "$HOME" ]]; then
  cd ~/workspace
fi

# User configuration.
setopt nonomatch
setopt rmstarsilent
setopt hist_find_no_dups
setopt inc_append_history
unsetopt extended_history

# Set usefull aliasses.
alias bu="brew update && brew upgrade && brew cleanup -s"
alias c="cargo"
alias rg="rg --no-heading --colors='path:fg:49,231,34' --colors='line:fg:229,229,16' --smart-case"
alias nu="nvim +PlugUpdate +PlugUpgrade +UpdateRemotePlugins"
alias pip="pip3"
alias python=python3
alias ssh="ssh -A"
alias tf="terraform"
alias vi="nvim"
alias vim="nvim"

# Some additional git aliasses.
alias git="hub"
alias gpsupr="gpsup && hub pull-request"
alias gpr="hub pull-request"
alias gt="git tag"
alias gdt="git difftool"
alias gfal="gfa && gl"

# Enable auto completions.
FPATH=/usr/local/share/zsh-completions:$FPATH

# Enable auto suggestions.
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable support for Ctrl-P.
bindkey '^P' fzf-file-widget

# Show which AWS profile is used.
aws_prompt_info() {
  if [[ -n $AWS_OKTA_PROFILE ]]; then
    echo "%{$fg_bold[blue]%}aws:(%{$orange%}$AWS_OKTA_PROFILE%{$fg[blue]%})%{$reset_color%} "
  fi
}

# Create a custom prompt.
result="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${result}%{$fg[cyan]%}%~%{$reset_color%} $(aws_prompt_info)$(git_prompt_info)
${result}%{$reset_color%}'
eval orange='$FG[214]'

# Source any custom plugins.
source ~/dotfiles/plugins.zsh
