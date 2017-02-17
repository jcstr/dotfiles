" update: 15/02/2017 7:00

" locales
set encoding=utf-8
"setlocal spell spelllang=es_MX

" pathogen
execute pathogen#infect() 

" color for indent guide
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" basic
set number
syntax on

" indentation
set tabstop=4
set noet                                                            
set shiftwidth=4
set autoindent
set si " smart indent

" Linebreak on 500 characters
set lbr
set tw=500

" color
set background=dark
colorscheme goldenrod

" wildmenu
set wildmenu
"set wildmode=longest:list,full

" powerline
set  rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
