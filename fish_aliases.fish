# Link this file to ~/.config/fish/conf.d/aliasses.fish
# ln -s ~/dotfiles/aliases.fish ~/.config/fish/conf.d/aliases.fish

###############################
#### Define custom aliases ####
###############################

# Set usefull aliasses.
alias bu "brew update && brew upgrade && brew cleanup -s"
alias c "cargo"
alias rg "rg --no-heading --colors='path:fg:155,204,112' --colors='line:fg:226,196,98' --colors='match:fg:247,91,122' --smart-case --sort='path'"
alias l "exa -la"
alias ls "exa"
alias nu "nvim +CocUpdateSync +PlugUpdate +PlugUpgrade +UpdateRemotePlugins"
alias pip "pip3"
alias python "python3"
alias ssh "ssh -A"
alias tf "terraform"
alias tree "exa -T"
alias vi "nvim"
alias vim "nvim"
alias vis "nvim +OpenSession"

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
