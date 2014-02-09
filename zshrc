# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pep8='pep8 --show-source'
alias pepocho='pep8'
alias check-pep8="find . -name '*.py*' -exec pep8 --ignore=E501 {} \;"
alias ..='cd ..'
alias ....='cd ....'
alias pcat='pygmentize -O bg=dark'
alias doctest='python -m doctest'
alias maild="sudo python -c 'import smtpd, asyncore; smtpd.DebuggingServer((\"127.0.0.1\", 25), None); asyncore.loop()'"
alias ff='find . -iname'
alias debug='cat > /tmp/debug.html&&w3m /tmp/debug.html'
alias vi='vim'

# Path variables
if [ -e $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi
if [ -e $HOME/android-sdk-linux ]; then
    export PATH=$PATH:$HOME/android-sdk-linux/tools
fi

# Pl editor
export EDITOR="vim"

alias manage="python manage.py"
alias mgr="python manage.py runserver"
alias mgs="python manage.py shell"
alias mgd="python manage.py dbshell"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias unquote="python -c 'import sys, urllib; print urllib.unquote_plus(sys.argv[1])'"
alias golint="go run $HOME/go/src/github.com/golang/lint/golint/golint.go"
alias jsonize="python -mjson.tool"

# oh-my-zsh confs
# This is the project page: https://github.com/robbyrussell/oh-my-zsh/
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
plugins=(git mercurial virtualenvwrapper svn python github tmux)
source $ZSH/oh-my-zsh.sh

setopt nocorrect_all

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export GOPATH="$HOME/go"

# No autocompletion
alias git="nocorrect git"
alias sbt="nocorrect sbt"
alias play="nocorrect play"

export TERM=xterm-256color
