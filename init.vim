set t_Co=256
set number
set nocompatible
set laststatus=2
call plug#begin()
	Plug 'morhetz/gruvbox'
	Plug 'scrooloose/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'rust-lang/rust.vim'
	Plug '~/.fzf'
	Plug 'mileszs/ack.vim'
	Plug 'pbondoer/vim-42header'
call plug#end()
let g:airline_theme='angr'
"execute pathogen#infect()
syntax on
set ruler
set mouse=a
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set autoindent
set autoread
set wildmenu
colorscheme gruvbox

let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_contrast_dark="medium"
set background=dark
let mapleader=","
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-T> :tabnew<CR>
nnoremap <C-m> :FZF<CR>
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map H gT
map L gt
map <silent> <leader>w :w<CR>
map <silent> <leader>q :q<CR>
map <silent> <leader>x :x<CR>
map <silent> <leader>n :tabnew<Cr>
