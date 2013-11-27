let &t_Co=256

"highlight Normal ctermfg=LightGrey ctermbg=NONE

set showcmd " show incomplete commands
filetype plugin on
filetype plugin indent on " load file type plugins + indentation
set backspace=indent,eol,start

" Color for GUI
if has('gui_running')
    set background=light
    colors solarized

    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right scrollbar
    set guioptions-=L  "remove left scrollbar
    set showtabline=2

    " If we are using the GUI, use proper fonts
    let g:airline_powerline_fonts = 1
    set guifont=Sauce\ Code\ Powerline

    " Make it transparent just in the Mac
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Darwin' || os == 'Mac'
        set transparency=3
    endif
else
    " I don't really like solarized on console
    set background=dark
    colors jelleybeans
endif

set number

" Keep 3 lines after/before the cursor
set so=3

" Horizontal line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline

syntax on

" Fix problem with vim-airline not showing the status line until you split
set laststatus=2
