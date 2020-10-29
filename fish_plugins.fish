# Link this file to ~/.config/fish/conf.d/fish_plugins.fish
# ln -s ~/dotfiles/fish_plugins.fish ~/.config/fish/conf.d/fish_plugins.fish

function ao
  set -l cmd "aws-okta list | awk 'FNR==1 {next} {print \$1}'"
  set -l profile (eval "$cmd" | FZF_DEFAULT_OPTS="--height 40% --reverse -e" fzf)
  if [ -n "$profile" ]
    source (aws-okta env "$profile" | sed -En 's/(.*)/export \1/p' | psub)
  end
end

function kspw
  set -l passwords (aws ssm describe-parameters --query 'Parameters[].Name' --output text | tr "\t" "\n" | grep "kepserver/password")
  if [ -z "$passwords" ]
    echo "No KepServer passwords found"
    return
  end

  set -l password "$passwords"
  if [ (string split " " "$passwords" | wc -l) -gt 1 ]
    set password (string split " " "$passwords" | sort | FZF_DEFAULT_OPTS="--height 40% --reverse" fzf)
  end

  if [ -n "$password" ]
    aws ssm get-parameter --name "$password" --with-decryption | jq -r '.Parameter.Value' | tr -d "\n" | pbcopy
    echo "KepServer password copied to clipboard"
  end
end

function kssh
  set -l instances (aws ssm describe-instance-information --query 'InstanceInformationList[].[Name,InstanceId]' --output text | grep --color=never "gg101")
  if [ -z "$instances" ]
    echo "No Greengrass instances found"
    return
  end

  set -l gg "$instances"
  if [ (string split " " "$instances" | wc -l) -gt 1 ]
    set gg (string split " " "$instances" | sort | FZF_DEFAULT_OPTS="--height 40% --reverse" fzf)
  end

  if [ -n "$gg" ]
    ssh (echo "$gg" | cut -f2)
  end
end

function krdp
  set -l instances (aws ssm describe-instance-information --query 'InstanceInformationList[].[Name,InstanceId]' --output text | grep --color=never "ks101")
  if [ -z "$instances" ]
    echo "No KepServer instances found"
    return
  end

  set -l ks "$instances"
  if [ (string split " " "$instances" | wc -l) -gt 1 ]
    set ks (string split " " "$instances" | sort | FZF_DEFAULT_OPTS="--height 40% --reverse" fzf)
  end

  if [ -n "$ks" ]
    set -l sitecode (echo "$ks" | cut -c 5-8)
    set -l password (aws ssm describe-parameters --query 'Parameters[].Name' --output text | tr "\t" "\n" | grep {$sitecode}_kepserver/password)
    aws ssm get-parameter --name "$password" --with-decryption | jq -r '.Parameter.Value' | tr -d "\n" | pbcopy
    echo "KepServer password copied to clipboard"

    bash -c "fish -c 'while [ (netstat -anp tcp | grep -c 127.0.0.1.3389) -eq 0 ]; sleep 1; end; xfreerdp ~/.cb-kit.rdp >/dev/null 2>&1' &"
    aws ssm start-session --target (echo "$ks" | cut -f2) --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["3389"],"localPortNumber":["3389"]}'
  end
end

function kdb
  set -l instances (aws ssm describe-instance-information --query 'InstanceInformationList[].[Name,IPAddress]' --output text | grep --color=never "ks101")
  if [ -z "$instances" ]
    echo "No KepServer instances found"
    return
  end

  set -l ks "$instances"
  if [ (string split " " "$instances" | wc -l) -gt 1 ]
    set ks (string split " " "$instances" | sort | FZF_DEFAULT_OPTS="--height 40% --reverse" fzf)
  end

  if [ -n "$ks" ]
    set -l sitecode (echo "$ks" | cut -c 5-8)
    set -l password (aws ssm describe-parameters --query 'Parameters[].Name' --output text | tr "\t" "\n" | grep {$sitecode}_kepserver/password)
    aws ssm get-parameter --name "$password" --with-decryption | jq -r '.Parameter.Value' | tr -d "\n" | pbcopy
    echo "KepServer password copied to clipboard"

    set -l gg (aws ssm describe-instance-information --query 'InstanceInformationList[].[Name,InstanceId]' --output text | grep {$sitecode}-gg101 | cut -f2)
    bash -c "fish -c 'while [ (netstat -anp tcp | grep -c 127.0.0.1.3389) -eq 0 ]; sleep 1; end; xfreerdp ~/.cb-kit.rdp >/dev/null 2>&1' &"
    ssh -L 3389:(echo "$ks" | cut -f2):3389 "$gg"
  end
end
