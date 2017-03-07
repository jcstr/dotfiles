" locales
set encoding=utf-8

"  Unix as the standard file type
set ffs=unix,dos,mac

" highlight search results
set hlsearch

" set the terminal title
set title

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

" golint
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

" go files
  autocmd FileType go set noexpandtab

" vim-go
let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 1

" set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file 
command W w !sudo tee % > /dev/null
