"""Basic Config"""
filetype plugin on 
filetype indent on 
syntax on
syntax enable

""Encoding
set encoding=utf-8
set fileencodings=utf-8,cp932

""Directories
set autochdir
set backup
set backupdir=$MY_VIMRUNTIME/vimtemp
set directory=$MY_VIMRUNTIME/vimtemp
set undodir=$MY_VIMRUNTIME/vimtemp
set viminfo+=n$MY_VIMRUNTIME/viminfo.txt

""Use Clipboard"
set clipboard=unnamed,autoselect

""Buffer
set hidden

""set Wildmode. Bash like complement
set wildmode=list:longest

""Search
set incsearch
set ignorecase
set smartcase
set hlsearch

