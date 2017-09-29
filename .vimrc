set encoding=utf-8
set ffs=unix,dos,mac
set hlsearch
set title
set number
syntax on
set autoread
set tabstop=4
set noet                                                            
set shiftwidth=4
set autoindent
set si
set lbr
set tw=500
set background=dark
set wildmenu
set laststatus=2
set t_Co=256

colorscheme goldenrod

execute pathogen#infect() 

let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='simple'

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" golint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" vim-go
let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 1

command W w !sudo tee % > /dev/null

