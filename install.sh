PWD=`pwd`

if [ ! -d ~/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

pip freeze > /tmp/pip_freeze

if [ "`cat /tmp/pip_freeze|grep ropevim|wc -l`" -eq "0" ]; then
    sudo pip install ropevim
fi

if [ "`cat /tmp/pip_freeze|grep flake8|wc -l`" -eq "0" ]; then
    sudo pip install flake8
fi

if [ "`cat /tmp/pip_freeze|grep pyflakes|wc -l`" -eq "0" ]; then
    sudo pip install pyflakes
fi

if [ "`cat /tmp/pip_freeze|grep hghooks|wc -l`" -eq "0" ]; then
    sudo pip install hghooks
fi

if [ "`egrep '^%include.*hg$' ~/.hgrc|wc -l`" -eq "0" ]; then
    echo "%include $PWD/hg" >> ~/.hgrc
fi

ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/vim ~/.vim
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/terminator ~/.config
ln -sf $PWD/gitconfig ~/.gitconfig

# Bundles installation
git submodule init
git submodule update
pushd
cd $PWD/vim/bundle/pyflakes-vim
git submodule init
git submodule update
popd

rm /tmp/pip_freeze
