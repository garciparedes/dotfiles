"""""""""""""""""""""""""""""""""""""
" garciparedes Vimrc configuration
"""""""""""""""""""""""""""""""""""""
set nocompatible
syntax on
set wrap
set linebreak
set nolist
set encoding=utf8

"""" START Vundle Configuration

" Disable file type for vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Python Extensions
Plugin 'vim-scripts/indentpython.vim'

" Git Support
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'

" Wakatime Plugin
Plugin 'wakatime/vim-wakatime'

" Themes
Plugin 'enricobacis/vim-airline-clock'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" OSX stupid backspace fix
set backspace=indent,eol,start

call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

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

" Tree Settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_preview = 1
let g:netrw_winsize = 80

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * if !isdirectory(expand(@%)) | :Vexplore | :exec "vertical resize ".(&columns / 5). " N" | wincmd w | endif
augroup END


" vmap <A-Left> <S-Left>
" vmap <A-Right> <S-Right>
