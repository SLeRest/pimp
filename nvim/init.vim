set number
set nocompatible
set laststatus=2
call plug#begin()
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
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
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rust-lang/rust.vim'
call plug#end()
let g:airline_theme='bubblegum'
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
"highlight link LspErrorText GruvboxRedSign

"colorscheme PaperColor " real one
colorscheme Dark2 " DEBUG de terminal windows
colorscheme gruvbox " real one
"let background="dark"
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
"let g:gruvbox_contrast_dark="hard"
let mapleader=","
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

" fzf config
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'highlight': 'Comment' } }

" floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let g:floaterm_wintitle=1
let g:floaterm_autoclose=1
function! Fzf_dev()
	let l:fzf_files_options = '--preview "bat --theme="gruvbox" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

	function! s:files()
		let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
		return s:prepend_icon(l:files)
	endfunction

	function! s:prepend_icon(candidates)
		let l:result = []
		for l:candidate in a:candidates
			let l:filename = fnamemodify(l:candidate, ':p:t')
			let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
			call add(l:result, printf('%s %s', l:icon, l:candidate))
		endfor

		return l:result
	endfunction

	function! s:edit_file(item)
		let l:pos = stridx(a:item, ' ')
		let l:file_path = a:item[pos+1:-1]
		execute 'silent e' l:file_path
	endfunction

	call fzf#run({
				\ 'source': <sid>files(),
				\ 'sink':   function('s:edit_file'),
				\ 'options': '-m ' . l:fzf_files_options,
				\ 'down':    '40%' })
endfunction
" git section 
set updatetime=100
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
