# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pep8='pep8 --ignore=E501 --show-source'
alias check-pep8="find . -name '*.py*' -exec pep8 --ignore=E501 {} \;"
alias ..='cd ..'
alias ....='cd ....'
alias pcat='pygmentize -O bg=dark'
alias doctest='python -m doctest'
alias maild="sudo python -c 'import smtpd, asyncore; smtpd.DebuggingServer((\"127.0.0.1\", 25), None); asyncore.loop()'"
alias ff='find . -iname'
alias debug='cat > /tmp/debug.html&&w3m /tmp/debug.html'

# Path variables
if [ -e $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi
if [ -e $HOME/android-sdk-linux ]; then
    export PATH=$PATH:$HOME/android-sdk-linux/tools
fi
export EL="/home/alex/eelogic"
export PL="/home/alex/paylogic"
export FO="$PL/paylogic/frontoffice"
export BO="$PL/paylogic/backoffice"
export API="$PL/paylogic/api"
export TW="$PL/paylogic/ticketware"
export ELA="$PL/paylogic/eelogic"
export LK="$HOME/lukkom"
export BL="$HOME/gplus-blog"
export ID5="$HOME/id5"

# Pl editor
export EDITOR="vim"

# Shortcuts
alias bo="workon paylogic;cd $BO"
alias fo="workon paylogic;cd $FO"
alias api="workon paylogic;cd $API"
alias el="workon eelogic;cd $EL"
alias tw="workon paylogic;cd $TW"
alias lk="workon lukkom;cd $LK"
alias bl="workon gplus-blog;cd $BL"
alias ela="workon paylogic;cd $ELA"
alias idenv="workon id5;cd $ID5"

alias manage="python manage.py"
alias mgr="python manage.py runserver"
alias mgs="python manage.py shell"
alias mgd="python manage.py dbshell"\
alias unquote="python -c 'import sys, urllib; print urllib.unquote_plus(sys.argv[1])'"

# oh-my-zsh confs
# This is the project page: https://github.com/robbyrussell/oh-my-zsh/
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="random"
plugins=(git mercurial virtualenvwrapper svn python github)
source $ZSH/oh-my-zsh.sh

setopt nocorrect_all

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
