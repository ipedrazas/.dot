call pathogen#infect()

let &t_Co=256
set background=dark
colors jellybeans
highlight Normal ctermfg=LightGrey ctermbg=NONE

set showcmd " show incomplete commands
filetype plugin on
filetype plugin indent on " load file type plugins + indentation
set backspace=indent,eol,start

" Color for GUI
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set showtabline=2
    set transparency=3
    highlight Normal ctermfg=LightGrey ctermbg=NONE
endif

" eyecandy
set statusline=%<%F%h%m%r%h%w\ %y\ %{&ff}\ %{strftime(\"%d/%m/%Y\ -\ %H:%M\")}%=\ col:%c%V\ lin:%l\ %P
set laststatus=2

" 80c & 120c limit, after that, red alert! :)
au BufWinEnter *.py set colorcolumn=80
au BufWinEnter *.py set wrap!
au BufWinEnter *.py let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
" more than 80c will be red colored
" autocmd ColorScheme * hi ErrorMsg ctermbg=NONE ctermfg=red
" Color for the 80 char column
autocmd ColorScheme * hi ColorColumn ctermbg=Black guibg=Black ctermfg=NONE guifg=NONE

set expandtab
au BufWinEnter * set autoindent|set ts=4|set sw=4
au BufWinEnter *.css set autoindent!
au BufWinEnter *.html,*.js set autoindent!|set ts=2|set sw=2

set number
set hlsearch
set ignorecase
set smartcase
set incsearch
set so=3

" active mouse on terminal
set mouse=a

" Horizontal line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline

" no idea lol
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Remove extra spaces at the end of the line
autocmd BufWritePre * :%s/\s\+$//e

" move between splits
map <C-Left> <C-W><Left>
map <C-Down> <C-W><Down>
map <C-Up> <C-W><Up>
map <C-Right> <C-W><Right>
" macvim version
map <C-D-Left> <C-W><Left>
map <C-D-Down> <C-W><Down>
map <C-D-Up> <C-W><Up>
map <C-D-Right> <C-W><Right>
" vim version
map <C-h> <C-W><Left>
map <C-j> <C-W><Down>
map <C-k> <C-W><Up>
map <C-l> <C-W><Right>

"move splits
map <A-Left> <C-W>H
map <A-Down> <C-W>J
map <A-Up> <C-W>K
map <A-Right> <C-W>L
" macvim version
map <A-D-Left> <C-W>H
map <A-D-Down> <C-W>J
map <A-D-Up> <C-W>K
map <A-D-Right> <C-W>L
" vim version
map <A-h> <C-W>H
map <A-j> <C-W>J
map <A-k> <C-W>K
map <A-l> <C-W>L

map <C-a> :resize 9999\|vertical resize 9999<CR>

"NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F9> :NERDTreeToggle<CR>

" flake8
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>
let g:flake8_max_line_length=80

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Avoid problem with robot framework tags
set tags=/dev/null

" Move codeblocks
vnoremap < <gv
vnoremap > >gv

" Better copy&paste
set clipboard=unnamed

" Autoreload
autocmd! bufwritepost .vimrc source %

" Rope
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace()<C-c>
let g:pymode_virtualenv = 1

" Better navigating through omnicomplete option list
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"Python folding
set nofoldenable

" Don't use pylint each save
let g:pymode_lint_write = 0

" Sort selected text
vnoremap <Leader>s :sort<CR>
