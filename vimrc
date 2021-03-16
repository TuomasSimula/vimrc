" Autocmd to run push-to-git.sh on write to push changes to git
autocmd BufWritePost vimrc silent! execute "!echo  ; if [ -f ./push-to-git.sh ]; then ./push-to-git.sh; fi;" | redraw!

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

" Some general rules
set encoding=utf-8
set scrolloff=5
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

" Colorscheme
colorscheme torte
