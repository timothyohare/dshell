syntax on

set autoindent
set ignorecase
set smartcase
set modeline

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

autocmd BufWritePre * :%s/\s\+$//e
match Todo /\s\+$/

"strip trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.h :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.cpp :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.txt :call <SID>StripTrailingWhitespaces()

"highlight trailing whitespace
match Todo /\s\+$/

set wildmenu
set nocompatible

if &diff
    set diffopt+=iwhite
    colorscheme desert
endif
set background=light

execute pathogen#infect()
