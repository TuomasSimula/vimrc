" Autocmd to run push-to-git.sh on write to push changes to git
let dir_name = fnamemodify(resolve(expand('%:p')), ':h')
autocmd BufWritePost *vimrc silent! execute "!echo  ; 
	\ if [ -f ".dir_name."/push-to-git.sh ]; then cd ".dir_name."; ./push-to-git.sh; fi;" | redraw!

" Automatically install vim-plug (from https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Get plugin vim-material
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'hzchirs/vim-material'
call plug#end()

" To get used to hjkl instead of arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Indenting rules
set autoindent
set tabstop=4
set shiftwidth=4
filetype plugin indent on
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Some general rules
set encoding=utf-8
set scrolloff=999
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start 

"undo file to save changes even between file writes
set undofile

" Syntax highlighting
syntax on

" Line numbers relative to cursor position
set relativenumber

" Cursor position
set ruler

" No error beeping
set visualbell

" Set leader key
let mapleader=","

" General key mappings
nnoremap <leader>o o<ESC>
nnoremap <space> i<space><ESC>l

" Search options
set hlsearch
set incsearch
set showmatch
set gdefault
set ignorecase
set smartcase
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Quick .vimrc editing and sourcing
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Text wrap settings
set wrap
set formatoptions=qrn1
set colorcolumn=85

" Disable modelines for security reasons
set nomodeline

" Confirm if unsaved changes
set confirm

" Show file path as title
set titlestring=%F
set title

" Map help key to ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Fold tag
nnoremap <leader>ft Vatzf

" Colorscheme vim-material from https://github.com/hzchirs/vim-material
if has('termguicolors')
	set termguicolors
endif
set background=dark
colorscheme vim-material
