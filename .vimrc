set t_Co=256
set number
set nocompatible
set laststatus=2
call plug#begin()
	Plug 'scrooloose/nerdtree'
	Plug '~/.fzf'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'rust-lang/rust.vim'
call plug#end()
let g:airline_theme='angr'
"execute pathogen#infect()
syntax on
set ruler
set mouse=a
set tabstop=4
set autoindent
set autoread
set wildmenu
colorscheme woju

map <C-n> :NERDTreeToggle<CR>
nnoremap <C-T> :tabnew<CR>:NERDTreeToggle<CR>
nnoremap <C-m> :FZF<CR>
"set number relativenumber
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map H gT
map L gt
map <silent> <leader>n :tabnew<Cr>
map <silent> <leader>c <C-w>c
map <silent> <leader>q ZQ
