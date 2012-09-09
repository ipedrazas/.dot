call pathogen#infect()

let &t_Co=256
set background=dark
colors BusyBee
highlight Normal ctermfg=LightGrey ctermbg=NONE

set showcmd " show incomplete commands
filetype plugin on
filetype plugin indent on " load file type plugins + indentation
set backspace=indent,eol,start

" Color for GUI
if has('gui_running')
    colors symfony
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set showtabline=2
    set guifont=DejaVu\ Sans\ Mono\ 9
    " default path
    cd /home/alex/paylogic
endif

" eyecandy
set statusline=%<%F%h%m%r%h%w\ %y\ %{&ff}\ %{strftime(\"%d/%m/%Y\ -\ %H:%M\")}%=\ col:%c%V\ lin:%l\ %P
set laststatus=2

" 80c & 120c limit, after that, red alert! :)
au BufWinEnter *.py set colorcolumn=80,120
au BufWinEnter *.py set wrap!
au BufWinEnter *.py let w:m1=matchadd('ErrorMsg', '\%>120v.\+', -1)
" more than 80c will be red colored
hi ErrorMsg ctermbg=NONE ctermfg=red
hi ColorColumn ctermbg=black guibg=black ctermfg=NONE guifg=NONE

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

" Rope
map <C-f> :lv "" **/*py<C-Left><Left><Left>
map <C-]> :call RopeGotoDefinition()<cr>

let ropevim_vim_completion=1
let ropevim_extended_complete=1
let ropevim_enable_shortcuts=1
function! TabWrapperRope()
  if strpart(getline('.'), 0, col('.')-1) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-R>=RopeCodeAssistInsertMode()\<CR>"
  endif
endfunction

" move between windows
map <C-Left> <C-W><Left>
map <C-Right> <C-W><Right>
map <C-Up> <C-W><Up>
map <C-Down> <C-W><Down>

"move windows
map <A-Up> <C-W>K
map <A-Down> <C-W>J
map <A-Left> <C-W>H
map <A-Right> <C-W>L

"NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <F9> :NERDTreeToggle<CR>

"Copy-paste normal way
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>

" flake8
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>
let g:flake8_max_line_length=120
