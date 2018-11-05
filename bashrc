#source ~/.profile

# Bash customisations to be syncronised between machines.
export PS1='\[\e[1;34m\][\u@\h \W]\$\[\e[0m\] '

# History
export HISTCONTROL=erasedups	# when adding an item to history, delete itentical commands upstream
export HISTSIZE=10000		# save 10000 items in history
shopt -s histappend		# append history to ~\.bash_history when exiting shell

# Lazy aliases
alias l='ls -ltr'
alias la='ls -Al'
alias ..='cd ..'
alias tree='tree -C'
alias trls='tree -C | less -R'	# -C outputs colour, -R makes less understand color
alias mode='(set -o | grep emacs.*on >/dev/null 2>&1 && echo "emacs mode" || echo "vi mode")'

# Rails aliases
alias sc='./script/console'
alias sg='./script/generate'
alias ss='./script/server'
alias sp='./script/server -e production'
alias t='rake spec'
alias ta='autotest -rails'
alias m='rake db:migrate'
alias vim='nvim'
alias vi='/usr/bin/vim'
# node
alias nombom="rm -rf node_modules && npm cache clean && npm i && rm -rf bower_components && bower cache clean && bower i && rm -rf tmp"


# git aliases
alias g='git'
# http://stackoverflow.com/a/15009611/128850
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
__git_complete g __git_main

# Vim aliases
alias rvim='mvim --remote-silent '

# Set terminal colors when launching screen
alias tmux="TERM=screen-256color-bce tmux"

# Functions
# Fuzzy cd
# Usage:
#    cdf public
# Changes to repos-public directory.
# http://dpaste.org/P59h/
function cdf() {
  cd *$1*/
}

# Reload .bashrc
alias refresh='. ~/.bashrc'

#export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function ps1_branch {
  b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$b" ]; then echo " $b"; fi
}

black="\[\e[30m\]"
red="\[\e[31m\]"
green="\[\e[32m\]"
yellow="\[\e[33m\]"
blue="\[\e[34m\]"
magenta="\[\e[35m\]"
cyan="\[\e[36m\]"
white="\[\e[37m\]"
reset="\[\e[0m\]"

export PS1="${yellow}» $blue\W$magenta\$(ps1_branch)\n$yellow\$$reset "


#if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
#  export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
#else
#  export VISUAL="nvim"
#fi
source ~/workspace/enhancd/init.sh

alias pv=". ~/workspace/env/bin/activate"
alias mux="if tmux ls; then tmux attach; else tmux; fi"
alias ep="source ~/.aws/proxy_config"
alias dp="source ~/.aws/noproxy"
alias listprofile="grep '\[' ~/.aws/credentials"
alias switchaws=""
alias jpterm="jpterm -m expression"




# added by Anaconda3 5.2.0 installer
saws() {
        export AWS_PROFILE=$1
}


get_mfa_token(){
  token=$1
  mfa=$(get_mfa)
#  response=`aws sts get-session-token --serial-number $mfa --token-code $token `
  now=$(date -u +"%Y-%m-%dT%H:%M:%SZ") 
  exp=$(aws configure get expiration)
  output=$(aws sts get-session-token --serial-number $mfa --query Credentials.[AccessKeyId,SecretAccessKey,SessionToken,Expiration]  --output text --token-code $token)
  echo "output: $otuput"
  read -r AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN EXPIRATION < <(echo "$output")
  
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
  export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN 

  cat <<END 
If another terminal session is need, copy and paste below lines:
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN 
END
#    echo aws configure set  aws_access_key_id $AWS_ACCESS_KEY_ID
#    echo aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
#    echo aws configure set aws_session_token $AWS_SESSION_TOKEN 
#    echo aws configure set expiration $EXPIRATION
#    echo "Token session is on."
}


srole(){
#set -x
  #aws sts assume-role --role-arn arn:aws:iam::123456789012:role/role-name --role-session-name "RoleSession1"
 role=$1
 id=`whoami`
 sn=`date +"$id-%d%m%Y-%H%M%S"`
 echo "sn: $sn"
 response=`aws sts assume-role --role-arn $role --role-session-name $sn`
 exp=`echo "$response" | awk -F '"' '/AccessKeyId/{print "export AWS_ACCESS_KEY_ID="strsub$4} /SecretAccessKey/{print "export AWS_SECRET_ACCESS_KEY="$4} /SessionToken/{ print "export AWS_SESSION_TOKEN="$4}'`
 eval `echo $exp`
 echo "$exp"
 echo "session name: $sn"
}

get_mfa(){
  aws iam list-mfa-devices --query MFADevices[].SerialNumber --output text
}

export PATH="~/bin:$PATH:.:~/.local/bin/:/anaconda3/bin"
alias pv=". ~/workspace/env/bin/activate"
alias mux="if tmux ls; then tmux attach; else tmux; fi"
alias ep="source ~/.aws/proxy_config"
alias dp="source ~/.aws/noproxy"
export smartsheet_key="2ivoff61klb7p1vdn1hfug5mlw"
alias listprofile="grep '\[' ~/.aws/credentials"
alias jpterm="jpterm -m expression"

complete -C aws_completer aws
pv
