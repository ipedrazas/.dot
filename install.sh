PWD=`pwd`

if [ ! -d ~/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ "`pip freeze|grep ropevim|wc -l`" -eq "0" ]; then
    sudo pip install ropevim
fi

if [ "`egrep '^%include.*hg$' ~/.hgrc|wc -l`" -eq "0" ]; then
    echo "%include $PWD/hg" >> ~/.hgrc
fi

ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/vim ~/.vim
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/terminator ~/.config
ln -sf $PWD/gitconfig ~/.gitconfig
