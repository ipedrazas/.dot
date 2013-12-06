#!/bin/bash

GREEN='\e[0;32m'
RED='\e[0;31m'
RESET='\e[0m' # No Color
PWD=`pwd`

function ok {
    echo -e "[${GREEN} OK ${RESET}] $1"
}

function warning {
    echo -e "[${RED} WARNING ${RESET}] $1"
}

#
# Install oh-my-zsh
#
if [ ! -d ~/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    ok "oh-my-zsh installed"
else
    warning "~/.oh-my-zsh already exists, remove it and try again!"
fi

#
# Install vim fonts
#
if [ ! -d ~/.fonts ]; then
    git clone https://github.com/Lokaltog/powerline-fonts.git ~/.fonts
    fc-cache -vf
    ok "vim fonts installed"
else
    warning "You already have some personal fonts, install the vim fonts manually: https://github.com/Lokaltog/powerline-fonts"
fi

#
# Install pip if it is not installed yet
#
if !(which pip &>> /dev/null); then
    sudo pacman -S python-pip
fi

#
# Check the needed python dependencies
#
pip freeze > /tmp/pip_freeze

function install_if_does_not_exist {
    if [ "`cat /tmp/pip_freeze|grep $1|wc -l`" -eq "0" ]; then
        sudo pip install $1
    fi
}

install_if_does_not_exist flake8
install_if_does_not_exist ropevim
install_if_does_not_exist pyflakes

#
# Create all the links
#
function warning_if_exists {
    if [ "$?" == 1 ]; then
        warning "$1 configuration already exists, remove it and try again!"
    fi
}

ln -s $PWD/vimrc ~/.vimrc &>> /dev/null
ln -s $PWD/vim ~/.vim &>> /dev/null
warning_if_exists vim
rm $HOME/.vim/vim  # just remove it, don't even bother checking

ln -s $PWD/zshrc ~/.zshrc &>> /dev/null
warning_if_exists zsh

ln -s $PWD/terminator ~/.config &>> /dev/null
warning_if_exists terminator

ln -s $PWD/gitconfig ~/.gitconfig &>> /dev/null
warning_if_exists git

ln -s $PWD/tmux.conf ~/.tmux.conf &>> /dev/null
warning_if_exists tmux

ln -s $PWD/pdbrc ~/.pdbrc &>> /dev/null
# Don't need to check

ok "Configurations linked properly"

git submodule update --init --recursive
ok "Submodules installed & updated"

rm /tmp/pip_freeze
