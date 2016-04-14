source ~/.bash_profile

# Export the custom nvr as editor so other tools (e.g. git) use this as well
export EDITOR=nvr

# In order for this to work properly, you need to run: pip3 install neovim-remote
alias vi="nvr"
alias vim="nvr"
alias nvim="nvr"
