" make Vim more useful
set nocompatible

execute pathogen#infect() 

filetype plugin on

set encoding=utf-8 nobomb
set ffs=unix,dos,mac
set hlsearch
set title

" think it twice
set secure
set exrc

set number
syntax on

" spell checking
"set spell spelllang=en_us

" indentation
set tabstop=4
set noet
set shiftwidth=4
set autoindent
set si
set lbr
set tw=500

" Linux kernel coding style
"set tabstop=8
"set softtabstop=8
"set shiftwidth=8
"set noexpandtab

set background=dark
colorscheme goldenrod
set wildmenu
set laststatus=2
set t_Co=256
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

" don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" don’t show the intro message when starting Vim
set shortmess=atI

" show the current mode (already on airline)
set noshowmode

" enable mouse in all modes
set mouse=a

" save with sudo
command W w !sudo tee % > /dev/null

" filetype stuff
autocmd FileType for PKGBUILD set expandtab shiftwidth=2 softtabstop=4
autocmd FileType go set noexpandtab
autocmd Filetype gitcommit setlocal textwidth=72

" filetype for PKGBUILD
augroup pkgbuild
    autocmd!
    autocmd BufRead,BufNewFile PKGBUILD set filetype=PKGBUILD
augroup END

" vim-go 
let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 1
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
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
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg = red   ctermbg = 3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg = green ctermbg = 4

" committia
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" vim-fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

