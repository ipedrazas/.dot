# Prompt
#zefram suse oliver adam1
#prompt adam1 transparent transparent white
prompt oliver

# Completion
zstyle ':completion:*' completer _expand _complete _correct _approximate

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ssh-tunnel="ssh -p 2222 -L 1234:10.108.0.76:3306 -o ServerAliveInterval=60 head-1.paylogic.nl"
alias pep8="pep8 --ignore=E501 --show-source"
alias ..='cd ..'
alias ....='cd ....'
alias pcat='pygmentize -O bg=dark'

# Path variables
export EL="/home/alex/eelogic"
export PL="/home/alex/paylogic"
export FO="$PL/paylogic/frontoffice"
export BO="$PL/paylogic/backoffice"
export API="$PL/paylogic/api"
export TW="$PL/paylogic/ticketware"

export EDITOR="vim"

# Shortcuts
alias bo="workon paylogic;cd $BO"
alias fo="workon paylogic;cd $FO"
alias api="workon paylogic;cd $API"
alias el="workon eelogic;cd $EL"
alias tw="workon paylogic;cd $TW"

# Virtualenvwrapper
export PIP_RESPECT_VIRTUALENV=true
export WORKON_HOME=~/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh
