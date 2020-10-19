# Link this file to ~/.config/fish/conf.d/aliasses.fish

###############################
#### Define custom aliases ####
###############################

# Set usefull aliasses.
alias bu "brew update && brew upgrade && brew cleanup -s"
alias c "cargo"
alias grep "rg --column --line-number --no-heading --color=always --colors='path:fg:49,231,34' --colors='line:fg:229,229,16' --smart-case"
alias l "exa -la"
alias ls "exa"
alias lssm "aws ssm get-inventory --query 'Entities[].[Id, Data.*.Content[].ComputerName, Data.*.Content[].IpAddress]' --output text"
alias nu "nvim +PlugUpdate +PlugUpgrade +UpdateRemotePlugins"
alias pip "pip3.8"
alias python "python3"
alias ssh "ssh -A"
alias tf "terraform"
alias vi "nvim"
alias vim "nvim"

# Some additional git aliasses.
alias git "hub"
alias gaa "git add --all"
alias gb "git branch"
alias gbd "git branch -d"
alias gcl "git clone"
alias gca "git commit -v -a"
alias gcan! "git commit -v -a --no-edit --amend"
alias gcb "git checkout -b"
alias gcd "git checkout develop"
alias gcm "git checkout master"
alias gco "git checkout"
alias gd "git diff"
alias gfa "git fetch --all --prune"
alias gfal "git fetch --all --prune && git pull"
alias gl "git pull"
alias glg "git log --stat"
alias gp "git push"
alias gpf "git push -f"
alias gpr "hub pull-request"
alias gpsup "git push --set-upstream origin (__svanharmelen_git_branch_name)"
alias gpsupr "gpsup && hub pull-request"
alias grb "git rebase"
alias grbi "git rebase -i"
alias gst "git status"
alias gt "git tag"
alias gtd "git tag"
