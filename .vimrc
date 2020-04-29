"""""""""""""""""""""""""""""""""""""
" garciparedes Vimrc configuration
"""""""""""""""""""""""""""""""""""""

"""" START Vundle Configuration
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'kien/ctrlp.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'wakatime/vim-wakatime'
Plugin 'valloric/youcompleteme'

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

Plugin 'enricobacis/vim-airline-clock'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'psf/black', { 'tag': '19.10b0' }
Plugin 'rust-lang/rust.vim'

Plugin 'preservim/nerdcommenter'

call vundle#end()
filetype plugin indent on    " required
"""" END Vundle Configuration

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

let mapleader = ","

syntax on
set wrap
set linebreak
set nolist
set encoding=utf8

set backspace=indent,eol,start

" set clipboard=unnamed

" Show linenumbers
set number
set ruler

" Always display the status line
set laststatus=2

set scrolloff=5
set undolevels=1000

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Status bar
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline_theme = "bubblegum"

" line comments
let g:NERDSpaceDelims = 1

" Tree Settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 80
let g:netrw_preview = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * if argc() == 0 || !isdirectory(argv()[0]) | NERDTree | wincmd w | endif
augroup END

" Splitting settings
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding settings
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview = 1

" Language specific settings

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2 |
"    \ set softtabstop=2 |
"    \ set shiftwidth=2 

" Autocompletion settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers = {'c': ['re!.']}
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" py << EOF
"   import os
"   import sys
"   if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF

" Code Hightlight
let python_highlight_all=1
syntax on
