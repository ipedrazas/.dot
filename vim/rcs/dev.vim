" more than 80c will be red colored
" autocmd ColorScheme * hi ErrorMsg ctermbg=NONE ctermfg=red
" Color for the 80 char column
autocmd ColorScheme * hi ColorColumn ctermbg=Black guibg=Black ctermfg=NONE guifg=NONE

set expandtab
au BufWinEnter * set autoindent|set ts=4|set sw=4
au BufWinEnter *.html,*.js,*.css set ts=2|set sw=2

" Sort selected text
vnoremap <Leader>s :sort<CR>

" flake8
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>
let g:flake8_max_line_length=80

" Remove extra spaces at the end of the line
autocmd BufWritePre * :%s/\s\+$//e

"Python folding
set nofoldenable
