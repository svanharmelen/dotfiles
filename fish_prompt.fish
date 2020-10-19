# Set some practical defaults.
function fish_mode_prompt; end
set -g fish_prompt_pwd_dir_length 0

################################
#### Define a custom prompt ####
################################

function fish_prompt
  set -l __last_command_exit_status $status

  set -l blue (set_color -o blue)
  set -l cyan (set_color -o cyan)
  set -l green (set_color -o green)
  set -l normal (set_color normal)
  set -l orange (set_color -o FFAF00)
  set -l red (set_color -o red)
  set -l yellow (set_color -o yellow)

  set -l arrow_color "$green"
  if [ "$__last_command_exit_status" != 0 ]
    set arrow_color "$red"
  end

  set -l arrow "$arrow_color➜ "
  set -l cwd $cyan(prompt_pwd)
  set -l mode_prompt (__svanharmelen_mode_prompt $arrow)

  if [ -n "$AWS_OKTA_PROFILE" ]
    set aws_info "$blue aws:($orange$AWS_OKTA_PROFILE$blue)"
  end

  if __svanharmelen_is_git_repo
    set git_branch $red(__svanharmelen_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    set dirty (__svanharmelen_is_git_dirty)
    if [ -n "$dirty" ]
      set dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  echo -nse $arrow $cwd $aws_info $git_info $normal \n$mode_prompt
end

function __svanharmelen_git_branch_name
  set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
  if set -q branch[1]
    echo (string replace -r '^refs/heads/' '' $branch)
  else
    echo (git rev-parse --short HEAD 2>/dev/null)
  end
end

function __svanharmelen_is_git_dirty
  echo (git status -s --ignore-submodules=dirty 2>/dev/null)
end

function __svanharmelen_is_git_repo
  type -q git
  or return 1
  git rev-parse --git-dir >/dev/null 2>&1
end

function __svanharmelen_mode_prompt -a prompt
  if [ "$fish_key_bindings" != "fish_vi_key_bindings" ]
    echo $prompt
  else
    switch $fish_bind_mode
      case default
        set_color 005FFF
        echo -n '[N]'
      case insert
        set_color 5FAF00
        echo -n '[I]'
      case replace-one
        set_color 870000
        echo -n '[R]'
      case visual
        set_color D75F00
        echo -n '[V]'
      end
    set_color normal
    echo -n ' '
  end
end

######################################
#### Define a custom right prompt ####
######################################

function fish_right_prompt
  set_color $fish_color_autosuggestion
  __svanharmelen_cmd_duration
  echo -n ' '
  env TZ="Europe/Amsterdam" date "+%H:%M:%S "
  set_color normal
end

function __svanharmelen_cmd_duration -S
  [ -z "$CMD_DURATION" -o "$CMD_DURATION" -lt 100 ]
  and return

  set exclude_cmd "bash|less|man|more|nvim|ssh|vi|vim"
  if echo $history[1] | grep --quiet "^$exclude_cmd.*" > /dev/null
    return
  end

  set -l cmd_duration (math -s0 $CMD_DURATION / 1000)
  set -l milliseconds (math -s0 $CMD_DURATION % 1000)
  set -l seconds (math -s0 $cmd_duration % 60)
  set -l minutes (math -s0 $cmd_duration % 3600 / 60)
  set -l hours (math -s0 $cmd_duration % 86400 / 3600)

  if [ $hours -gt 0 ]
    printf '(%d.%02dh)' $hours $minutes
  else if [ $minutes -gt 0 ]
    printf '(%d.%02dm)' $minutes $seconds
  else if [ $seconds -gt 0 ]
    printf '(%d.%02ds)' $seconds $milliseconds
  else
    printf '(%dms)' $milliseconds
  end
end
