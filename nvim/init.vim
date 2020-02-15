set t_Co=256
set number
set nocompatible
set laststatus=2
call plug#begin()
	Plug 'yuki-ycino/fzf-preview.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'KabbAmine/zeavim.vim'
	Plug 'jremmen/vim-ripgrep'
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mileszs/ack.vim'
	Plug 'Lenovsky/nuake'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'rust-lang/rust.vim'
	Plug 'pbondoer/vim-42header'
call plug#end()
let g:airline_theme='angr'
"execute pathogen#infect()
syntax on
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><C-tab> pumvisible() ? "\<c-n>" : "\<tab>"<Paste>
set ruler
set mouse=a
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set autoindent
set autoread
set wildmenu
nnoremap <C-b> :Nuake<CR>
inoremap <C-b> <C-\><C-n>:Nuake<CR>
tnoremap <C-b> <C-\><C-n>:Nuake<CR>
let g:nuake_size = 0.5
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_contrast_dark="hard"
highlight link LspErrorText GruvboxRedSign
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

"colorscheme PaperColor " real one
colorscheme gruvbox " real one
let background="dark"
let mapleader=","
nnoremap <C-T> :tabnew<CR>
nnoremap <C-m> :FzfPreviewDirectoryFiles<CR>
nnoremap <C-S-M> :FzfPreviewProjectGrep<CR>
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

if &term == 'screen-256color'
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
endif
map H gT
map L gt
map <silent> <leader>w :w<CR>
map <silent> <leader>q :q<CR>
map <silent> <leader>x :x<CR>
