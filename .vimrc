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
Plug 'valloric/youcompleteme'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'enricobacis/vim-airline-clock'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
Plug 'psf/black'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdcommenter'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'

call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

let mapleader = ","

set hlsearch

syntax on
colorscheme onedark
" let g:onedark_termcolors=256
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

set tags=tags
autocmd BufWritePost *.py silent! !ctags -R --python-kinds=-i --languages=python 2&gt; /dev/null &amp;

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
