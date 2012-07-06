function! LoadRope()
python << EOF
import ropevim
EOF
endfunction

call LoadRope()

"Unmap ropevim doc, change it to ?
unmap <C-c>d
map <F1> :call RopeShowDoc()<CR>
