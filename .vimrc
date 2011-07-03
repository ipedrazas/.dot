"colors torte
let &t_Co=256
set background=dark
colors BusyBee
highlight Normal ctermfg=LightGrey ctermbg=NONE

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

" 80c & 120c limit, after that, red alert! :)
au BufWinEnter *.py set colorcolumn=80,120
au BufWinEnter *.py set wrap!
au BufWinEnter *.py let w:m1=matchadd('ErrorMsg', '\%>120v.\+', -1)
" more than 80c will be red colored
hi ErrorMsg ctermbg=NONE ctermfg=red
hi ColorColumn ctermbg=black guibg=black ctermfg=NONE guifg=NONE

set ts=4
set expandtab
set sw=4
set autoindent

set number
set hlsearch
set ignorecase
set incsearch

" active mouse on terminal
set mouse=a

" Horizontal line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline

" no idea
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Remove extra spaces at the end of the line
autocmd BufWritePre * :%s/\s\+$//e

" Rope searchs
map <C-f> :lv "" **/*py<C-Left><Left><Left>
map <C-]> :call RopeGotoDefinition()<cr>

filetype plugin on
filetype plugin indent on

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

set statusline=%<%F%h%m%r%h%w\ %y\ %{&ff}\ %{strftime(\"%d/%m/%Y\ -\ %H:%M\")}%=\ col:%c%V\ lin:%l\ %P
set laststatus=2

" move between windows
map <C-Left> <C-W><Left>
map <C-Right> <C-W><Right>
map <C-Up> <C-W><Up>
map <C-Down> <C-W><Down>

map <A-Left> :tabp<CR>
map <A-Right> :tabn<CR>

map <C-S-Left> <C-W>H
map <C-S-Right> <C-W>L
map <C-S-Up> <C-W>K
map <C-S-Down> <C-W>J

"map - <C-W>-
"map + <C-W>+
map - <C-W><<C-W>-
map + <C-W>><C-W>+

map <F5> :NERDTreeToggle<CR>

vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
