execute pathogen#infect()

filetype plugin indent on

set encoding=utf-8 nobomb
set ffs=unix,dos,mac
set hlsearch
set title

set number
syntax on

" indentation
set tabstop=4
set noexpandtab
set shiftwidth=4
set autoindent
set smartindent
set linebreak
set textwidth=500

set background=dark
colorscheme goldenrod
set wildmenu
set laststatus=2
set autoread

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" don't create backups when editing files in certain directories
set backupskip=/tmp/*

" don't show the intro message when starting Vim
set shortmess+=atI

" show the current mode (already on lightline)
set noshowmode

" enable mouse in all modes
set mouse=a

" save with sudo
command W w !sudo tee % > /dev/null

" filetypes
augroup filetypes
    autocmd!
    autocmd FileType PKGBUILD setlocal expandtab shiftwidth=2 softtabstop=4
    autocmd FileType go setlocal noexpandtab
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType python setlocal expandtab autoindent tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
augroup END

" PKGBUILD
augroup pkgbuild
    autocmd!
    autocmd BufRead,BufNewFile PKGBUILD set filetype=PKGBUILD
augroup END

" vim-go
let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ }

" indent guides
let g:indent_guides_auto_colors = 0
augroup indentguides
    autocmd!
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
augroup END

" vim-fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Git blame<CR>
