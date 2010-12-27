call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set ts=4
set sts=4
set sw=4
syn on
set et
colorscheme ir_black
imap hh <Esc>
set ruler
set modeline
filetype off
filetype plugin indent on
syntax on
set nocompatible
set t_Co=256

cmap w!! w !sudo tee % > /dev/null
