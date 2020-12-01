"""""""""""""""""""""""""""""""""""""
" garciparedes Vimrc configuration
"""""""""""""""""""""""""""""""""""""

"""" START Vundle Configuration
call plug#begin('~/.vim/plugged')

Plug 'gmarik/Vundle.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'wakatime/vim-wakatime'
" Plug 'valloric/youcompleteme'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'enricobacis/vim-airline-clock'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
" Plug 'psf/black'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdcommenter'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'elzr/vim-json'
Plug 'danro/rename.vim'
Plug 'lervag/vimtex'

call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

let mapleader = ","
let g:mapleader = ","

set hlsearch
set wildmenu
set wildmode=full

set termguicolors
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"

set nocompatible
filetype on
syntax on
colorscheme onedark
set colorcolumn=121

set wrap
set linebreak
set nolist
set encoding=utf8
set guioptions=

set backspace=indent,eol,start

" Show linenumbers
set number
set relativenumber
set ruler

set mouse=a
set clipboard=unnamed

" Always display the status line
set laststatus=2

set scrolloff=5
set undolevels=1000

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set cursorcolumn
set cursorline

" Navigation with soft wrap
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Status bar
let g:airline_powerline_fonts = 1
let g:airline_theme = "onedark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>10 <Plug>AirlineSelectTab10

" line comments
let g:NERDSpaceDelims = 1

" Tree Settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 80
let g:netrw_preview = 1
let g:NERDTreeShowHidden=1
let NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

autocmd VimEnter * silent! lcd %:p:h
autocmd DirChanged * silent! NERDTreeCWD | wincmd p 

nmap <leader>n :NERDTreeFind<CR>
nmap <leader>m :NERDTreeToggle<CR>

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * if argc() == 0 || !isdirectory(argv()[0]) | NERDTree | wincmd w | endif
augroup END

" Splitting settings
set splitbelow
set splitright

" Navigating across panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Better behavior related with removals and buffers.
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d "*d
nnoremap <leader>D "*D
vnoremap <leader>d "*d

" fzf shorcuts
nnoremap <silent> <C-t> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" Folding settings
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview = 1

" Language specific settings

let g:ale_linters = {'rust': ['rustc']}
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

" Autocompletion settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers = {'c': ['re!.']}
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



" GUI settings
if has("gui_running")
    set guifont="Inconsolata\ Nerd\ Font:h13"
    set lines=48 columns=164
    set guioptions=
endif

if has('mouse_sgr')
    set ttymouse=sgr
endif

source $VIMRUNTIME/mswin.vim

set shell=fish
tnoremap <Esc> <C-\><C-n>

let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
let g:vimtex_compiler_engine='pdflatex'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-shell-escape',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

