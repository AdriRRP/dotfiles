syntax on

set noerrorbells "Disable error bells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab "Insert space chars when tab key pressed
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Calling plugin section
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"Install plugin manager if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugin section

"Auto complete Plugin
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
