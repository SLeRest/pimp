set t_Co=256
set nocompatible
set laststatus=2
execute pathogen#infect()
syntax on
filetype plugin indent on
set ruler
set mouse=a
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
set tabstop=4
set autoindent

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map H gT
map L gt
map <silent> <leader>n :tabnew<Cr>
map <silent> <leader>c <C-w>c
map <silent> <leader>q ZQ
