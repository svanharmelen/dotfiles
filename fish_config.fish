# This file contains config options which are persisted
# within the fish shell. So these commands only have to
# be run once (manually) on fresh systems:
#
# $ fish fish_config.fish

######################################
#### Define environment variables ####
######################################

# Set some default paths.
set -U fish_user_paths /usr/local/sbin $HOME/.cargo/bin $HOME/go/bin

########################################
#### Configure personal preferences ####
########################################

# Make sure we use vim mode.
fish_vi_key_bindings

# Standard colors:
set -U fish_color_autosuggestion 767676
set -U fish_color_cancel normal
set -U fish_color_command FFFFFF
set -U fish_color_comment BCBCBC
set -U fish_color_cwd 008000
set -U fish_color_cwd_root 800000
set -U fish_color_end E4E4E4
set -U fish_color_error FF5F5F
set -U fish_color_escape 00A6B2
set -U fish_color_history_current normal
set -U fish_color_host normal
set -U fish_color_match normal
set -U fish_color_normal normal
set -U fish_color_operator 00A6B2
set -U fish_color_param D7D7D7
set -U fish_color_quote FFD700
set -U fish_color_redirection D7D7D7
set -U fish_color_search_match FFFF00
set -U fish_color_selection C0C0C0
set -U fish_color_user 00FF00
set -U fish_color_valid_path normal

# Colors for highlighting in the completion pager:
set -U fish_pager_color_completion normal
set -U fish_pager_color_description 'B3A06D' 'yellow'
set -U fish_pager_color_prefix 87AF87
set -U fish_pager_color_progress 'brwhite' '--background=cyan'

###################################
#### Disable builtin functions ####
###################################

# Do not display the default greeting.
function fish_greeting; end
funcsave fish_greeting

# Do not display the default mode prompt.
function fish_mode_prompt; end
funcsave fish_mode_prompt
