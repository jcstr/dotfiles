" make Vim more useful
set nocompatible

execute pathogen#infect() 

filetype plugin on

set encoding=utf-8 nobomb

set ffs=unix,dos,mac

set hlsearch

set title

" !!!
set secure
set exrc

set number
syntax on

" indentation
set tabstop=4
set noet                                                            
set shiftwidth=4
set autoindent
set si
set lbr
set tw=500
set background=dark
colorscheme goldenrod

set wildmenu
set laststatus=2

set t_Co=256

set autoread

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

" show the current mode
set showmode

" enable mouse in all modes
set mouse=a

" save with sudo
command W w !sudo tee % > /dev/null

" general filetype stuff
autocmd FileType for PKGBUILD set expandtab shiftwidth=2 softtabstop=4
autocmd FileType go set noexpandtab
autocmd Filetype gitcommit setlocal textwidth=72

" filetype for PKGBUILD
augroup pkgbuild
    autocmd!
    autocmd BufRead,BufNewFile PKGBUILD set filetype=PKGBUILD
augroup END

" go 
let g:go_autodetect_gopath = 0
let g:go_disable_autoinstall = 1
let g:go_fmt_autosave = 1
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
let g:go_fmt_command = "goimports"

" lightline
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ }

" indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg = red   ctermbg = 3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg = green ctermbg = 4

" committia
" You can get the information about the windows with first argument as a dictionary.
"
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto

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

