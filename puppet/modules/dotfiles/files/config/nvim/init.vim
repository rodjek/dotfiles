" Plugins {{{
runtime plugins.vim
filetype plugin indent on
" }}}
" Colours {{{
set t_Co=256
"set termguicolors
set background=dark
let ayucolor="mirage"
colorscheme gruvbox
syntax on
" }}}
" Spaces and tabs {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=indent,eol,start
" }}}
" Searching {{{
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
" }}}
" UI {{{
set ruler
set number
set modeline
set showmode
set wrap
set textwidth=79
set formatoptions=qrn1
set ruler
set cursorline
" }}}
" Misc {{{
set nocompatible
set encoding=utf-8
set laststatus=2
set modelines=1
" }}}
" Mappings {{{
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>
cmap w!! w !sudo tee % > /dev/null
nnoremap j gj
nnoremap k gk
" }}}
" Leader mappings {{{
let mapleader = ","
" }}}
" Backups {{{
set backup
set backupdir=~/.config/nvim/tmp,/tmp
set backupskip=/tmp
set directory=~/.config/nvim/tmp,/tmp
set writebackup
" }}}

let g:EasyMotion_keys = 'aoeuidhtns'
let g:EasyMotion_smartcase = 1

:highlight ExtraWightspace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

set undodir=~/.config/nvim/undodir
set undofile

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

let g:syntastic_quiet_messages = {}

" vim:foldmethod=marker:foldlevel=0
