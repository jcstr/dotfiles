"Update: 01/02/2017 23:21

set encoding=utf-8

" pathogen
execute pathogen#infect() 

" color for indent guide
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

set number
syntax on

" indentation
set tabstop=4
set noet                                                            
set shiftwidth=4
set autoindent
set si "Smart indent

" Linebreak on 500 characters
set lbr
set tw=500

" color
set background=dark
colorscheme goldenrod

" interface
set wildmenu

" status line
set laststatus=2
" format
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
