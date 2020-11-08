# Easily switch between AWS roles.
function ao() {
  local cmd="aws-okta list | awk 'FNR==1 {next} {print \$1}'"
  local profile="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height 40% +x --reverse" fzf)"
  if [[ -n $profile ]]; then
    source <(aws-okta env "$profile")
  fi
}

function kspw() {
  local passwords="$(
    aws ssm describe-parameters --query 'Parameters[].Name' --output text | tr '\t' '\n' | grep 'kepserver/password'
  )"
  if [[ -z $passwords ]]; then
    echo "No KepServer passwords found"
    return
  fi

  local password=$passwords
  if [[ $(echo "$passwords" | wc -l) -gt 1 ]]; then
    password="$(echo "$passwords" | sort | FZF_DEFAULT_OPTS="--height 40% +x --reverse" fzf)"
  fi

  if [[ -n $password ]]; then
    aws ssm get-parameter --name $password --with-decryption | jq -r '.Parameter.Value' | tr -d "\n" | pbcopy
    echo "KepServer password copied to clipboard"
  fi
}

function kssh() {
  local instances="$(
    aws ssm describe-instance-information --query 'InstanceInformationList[].[Name,InstanceId]' --output text | grep --color=never 'gg101'
  )"
  if [[ -z $instances ]]; then
    echo "No Greengrass instances found"
    return
  fi

  local gg=$instances
  if [[ $(echo "$instances" | wc -l) -gt 1 ]]; then
    gg="$(echo "$instances" | sort | FZF_DEFAULT_OPTS="--height 40% +x --reverse" fzf)"
  fi

  if [[ -n $gg ]]; then
    ssh $(echo $gg | cut -f2)
  fi
}

function krdp() {
  local instances="$(
    aws ssm describe-instance-information --query 'InstanceInformationList[].[Name,InstanceId]' --output text | grep --color=never 'ks101'
  )"
  if [[ -z $instances ]]; then
    echo "No KepServer instances found"
    return
  fi

  local ks=$instances
  if [[ $(echo "$instances" | wc -l) -gt 1 ]]; then
    ks="$(echo "$instances" | sort | FZF_DEFAULT_OPTS="--height 40% +x --reverse" fzf)"
  fi

  if [[ -n $ks ]]; then
    sitecode=$(echo $ks | cut -c 5-8)
    password=$(aws ssm describe-parameters --query "Parameters[].Name" --output text | tr "\t" "\n" | grep ${sitecode}_kepserver/password)
    aws ssm get-parameter --name $password --with-decryption | jq -r '.Parameter.Value' | tr -d "\n" | pbcopy
    echo "KepServer password copied to clipboard"

    exec "$(while [[ $(netstat -anp tcp | grep -c 127.0.0.1.3389) -eq 0 ]]; do sleep 1; done; xfreerdp ~/.cb-kit.rdp >/dev/null 2>&1)" &
    aws ssm start-session --target $(echo $ks | cut -f2) --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["3389"],"localPortNumber":["3389"]}'
  fi
}

function kdb() {
  local instances="$(
    aws ssm describe-instance-information --query 'InstanceInformationList[].[Name,IPAddress]' --output text | grep --color=never 'ks101'
  )"
  if [[ -z $instances ]]; then
    echo "No KepServer instances found"
    return
  fi

  local ks=$instances
  if [[ $(echo "$instances" | wc -l) -gt 1 ]]; then
    ks="$(echo "$instances" | sort | FZF_DEFAULT_OPTS="--height 40% +x --reverse" fzf)"
  fi

  if [[ -n $ks ]]; then
    sitecode=$(echo $ks | cut -c 5-8)
    password=$(aws ssm describe-parameters --query "Parameters[].Name" --output text | tr "\t" "\n" | grep ${sitecode}_kepserver/password)
    aws ssm get-parameter --name $password --with-decryption | jq -r '.Parameter.Value' | tr -d "\n" | pbcopy
    echo "KepServer password copied to clipboard"

    local gg="$(
      aws ssm describe-instance-information --query 'InstanceInformationList[].[Name,InstanceId]' --output text | grep $sitecode-gg101 | cut -f2
    )"
    exec "$(while [[ $(netstat -anp tcp | grep -c 127.0.0.1.3389) -eq 0 ]]; do sleep 1; done; xfreerdp ~/.cb-kit.rdp >/dev/null 2>&1)" &
    ssh -L 3389:$(echo $ks | cut -f2):3389 $gg
  fi
}

# This speeds up pasting w/ autosuggest
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
