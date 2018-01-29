" Vundle reqs
set nocompatible
filetype off

" Enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages Vundle
Plugin 'VundleVim/Vundle.vim'

" User plugins
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_powerline_fonts = 1

" For teh lulz
set list
set listchars=trail:▓

" LaTeX Live preview plugin
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'

syntax on
set ruler
set number
set autoindent
map <F5> :w!<cr>:!perl %<cr>
