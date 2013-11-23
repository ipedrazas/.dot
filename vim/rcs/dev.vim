set rtp+=$GOROOT/misc/vim

au BufWinEnter *.html,*.js,*.css,*.scss,*.scala set ts=2|set sw=2

" Sort selected text
vnoremap <Leader>s :sort<CR>

" Remove extra spaces at the end of the line
autocmd BufWritePre * :%s/\s\+$//e

set nofoldenable
