" Plugins
set shell=/bin/bash\ --login

filetype off
runtime plugins.vim
filetype plugin indent on
set nocompatible

" Colours 
syntax on
set termguicolors
set background=dark
colorscheme srcery

" Spaces and tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=indent,eol,start
set shiftround

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>:call clearmatches()<cr>

" UI
set ruler
set number
set showmode
set showcmd
"set wrap
set textwidth=79
set formatoptions=qrn1c
set ruler
set cursorline
set colorcolumn=+1

" Misc
set encoding=utf-8
set laststatus=2
set modelines=0
set history=1000
set autowrite
set autoread

set splitbelow
set splitright

" Spelling
set dictionary=/usr/share/dict/british-english
set spellfile=$XDG_CONFIG_HOME/nvim/dict.utf-8.add,$XDG_CONFIG_HOME/nvim/dict.local.utf-8.add
nnoremap zG 2zg

" Mappings
inoremap jj <ESC>
cmap w!! w !sudo tee % > /dev/null
nnoremap j gj
nnoremap k gk

" Leader mappings
let mapleader = ","

let g:rspec_command = "!bundle exec rspec {spec}"
nnoremap <leader>mra :call RunAllSpecs()<CR>
nnoremap <leader>mrf :call RunCurrentSpecFile()<CR>
nnoremap <leader>mrn :call RunNearestSpec()<CR>
nnoremap <leader>sh <C-W><C-H>
nnoremap <leader>sj <C-W><C-J>
nnoremap <leader>sk <C-W><C-K>
nnoremap <leader>sl <C-W><C-L>
nnoremap <leader>cc :Clap files<CR>
nnoremap <leader>cb :Clap buffers<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Backups
set backup
set noswapfile
set undofile
set writebackup

set backupdir=$XDG_DATA_HOME/nvim/backup
set undodir=$XDG_DATA_HOME/nvim/undo
set directory=$XDG_CACHE_HOME/nvim

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

let g:EasyMotion_keys = 'aoeuidhtns'
let g:EasyMotion_smartcase = 1

:highlight ExtraWightspace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/


"set viewoptions=folds,cursor
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview

highlight nonascii guibg=red ctermbg=1 term=standout
au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"

let g:syntastic_quiet_messages = {}

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:lightline = {
    \ 'colorscheme': 'srcery',
    \ }

if has('autocmd')
    augroup vim
        autocmd! BufWritePost $MYVIMRC source % | redraw
    augroup END
endif
