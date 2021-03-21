# Link this file to ~/.config/fish/config.fish
# ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish

# Start by installing and running fisher.
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

######################################
#### Define environment variables ####
######################################

# Options for the fzf command.
set -U FZF_DEFAULT_OPTS "+x --height=40% --reverse"
set -U FZF_LEGACY_KEYBINDINGS 0

# Use j instead of z for jumping around.
set -U Z_CMD j

# Set my prefered editor.
set -x EDITOR nvim

# Set the language and make sure we use UTF-8.
set -x LANG en_US.UTF-8

# Set custom colors for EXA.
set -l file_classes "fi=0:pi=33:cd=34;43:di=1;36:so=32:ln=35:ex=31:bd=34;46:or=31"
set -l file_sizes_and_owners "sn=0:sb=0:df=0:ds=0:uu=0:un=0:gu=0:gn=0"
set -l metadata "xx=0:da=0:in=0:bl=0:hd=0:lp=0:cc=0:lc=0:lm=0:ga=0:gm=0:gd=0:gv=0:gt=0:bO=0"
set -l permissions "ur=0:uw=0:ux=0:ue=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:su=0:sf=0:xa=0"
set -x EXA_COLORS "reset:$file_classes:$file_sizes_and_owners:$metadata:$permissions"

# Source my Github username and token variables.
source (/usr/local/bin/envchain -l github -v | sed -En 's/(.*)/export \1/p' | psub)

# Source my Jira username and token variables.
source (/usr/local/bin/envchain -l jira -v | sed -En 's/(.*)/export \1/p' | psub)

# Enable AWS completion.
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

########################################
#### Configure personal preferences ####
########################################

# Change into my working directory.
if [ "$PWD" = "$HOME" ]
  cd ~/workspace
end

# Use CTRL-P to search for files.
bind \cp '__fzf_find_file'
if bind -M insert >/dev/null 2>/dev/null
  bind -M insert \cp '__fzf_find_file'
end
