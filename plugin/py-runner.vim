if !exists('g:py_runner')
let g:py_runner = '<F8>'
endif

execute "nnoremap <silent> ".g:py_runner." :silent call ExecRunner()<CR>"
execute "inoremap <silent> ".g:py_runner." <Esc>:silent call ExecRunner()<CR>"

fu! NBF()
    new
    setlocal noreadonly
    setlocal modifiable
    setlocal filetype=runner
    setlocal nobuflisted
    setlocal nolist
    setlocal nospell
    setlocal nowrap
    setlocal nofoldenable
    setlocal foldcolumn=1
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide
    map <buffer> <silent> q :quit<CR>
endf

function! ExecRunner()
let runner = &ft
if (runner=='runner')
return
endif
only
%y
call NBF()
    wincmd J
    resize 10
    0 put
    exe '%!' . runner
    0 read !date
let text = "Press q to exit"
exe "normal! o" . text . "\<Esc>"
    append
------------------------------
.
setlocal readonly
    setlocal nomodifiable
endfunction

