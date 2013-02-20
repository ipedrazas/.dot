call pathogen#infect()

" Shared dev options, remember that python options are on
" ~/.vim/ftplugin/python.vim
so ~/.vim/rcs/dev.vim
so ~/.vim/rcs/eye-candy.vim
so ~/.vim/rcs/misc.vim
so ~/.vim/rcs/windows.vim

if has('gui_macvim')
    so ~/.vim/rcs/mac.vim
endif
