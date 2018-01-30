"Default Setting
"" Config PATH 
let $XDG_CONFIG_HOME=$HOME.'/.config'
let $VIM_PLUG = $XDG_CONFIG_HOME.'/nvim/plugged'
set rtp^=$XDG_CONFIG_HOME,$VIM_PLUG

""Vim-Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'Shougo/vimproc'
Plug 'tyru/eskk.vim'
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun'
Plug 'yuratomo/w3m.vim'

call plug#end()

"Basic Config
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
set backupdir=$XDG_CONFIG_HOME/nvim/temp
set directory=$XDG_CONFIG_HOME/nvim/temp
set undodir=$XDG_COFIG_HOME/nvim/temp
set viminfo+=n"$XDG_CONFIG_HOME/nvim/temp

""Use Clipboard
set clipboard=unnamedplus

""Buffer
set hidden

""set Wildmode. Bash like complement
set wildmode=list:longest

""Search
set incsearch
set ignorecase
set smartcase
set hlsearch

"Key Config"""
""macvimではoption+\がleaderになるので変更

let g:mapleader = ','

""Cursol move
set whichwrap=b,s,h,l,<,>,[,],~

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

""Change yank key. Yank from cursol to line end.
"http://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap Y y$

""ESC in insert-mode
inoremap <silent> jj <ESC>

""Edit .vimrc""
"http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
""Reload .vimrc""
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

""No hlsearch with ESC-ESC
nnoremap <ESC><ESC> :<C-u>set nohlsearch!<CR>

""Toggle relativenumber
nnoremap <F2> :<C-u>setlocal relativenumber!<CR>

""move to other Windows
""http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
"""s+hjkl move to window
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
"""s+nptT move to tab
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
"""s+sv split window
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
"""s+qQ kill buffer or window
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

"Display Setting

""Cursol
set number
set cursorline

""number
set relativenumber

""Show Invisible Characters""
"""http://qiita.com/X___MOON___X/items/26d3f292537bad197f64
map <silent> <F3> :set list!<CR>
set list
set listchars=tab:>_,trail:_

""Show all lines
"""http://itchyny.hatenablog.com/entry/2014/12/25/090000
set display=lastline

""Set Tab line
"""http://d.hatena.ne.jp/thinca/20111204/1322932585
set showtabline=2
set guioptions-=e

""Set list height
set pumheight=10

""Set matching
set showmatch
set matchtime=1

""TabWidth
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent


"Plugin Settings"

""eskk
 set imdisable
 imap <C-^> <Plug>(eskk:toggle)
 if has('vim_starting')
 let g:eskk#directory= '~/.config/nvim/eskk/'
 let g:eskk#dictionary= {
			 \'path': '~/.config/nvim/eskk/USER.L',
			 \'encoding': 'utf-8'
			 \}
 let g:eskk#large_dictionary = {
			 \'path': '~/.config/nvim/eskk/SKK-JISYO.L',
			 \'encoding': 'euc-jp'
			 \}
 endif

""lightline""
set laststatus=2
let g:lightline = { 
        \'colorscheme': 'solarized'
        \,
        \'active': {
        \  'left':[ ['mode', 'paste'], ['readonly','modified'],['filename'] ],
        \  'right':[ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ],
        \},
        \'component_function': {
        \    'mode': 'Mymode',
        \ },
         \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6" }, 
        \ 'subseparator': { 'left': "\ue0b5", 'right': "\ue0b7" },
        \ 'tabline_separator': { 'left': "\ue0b8", 'right': "\ue0bA" }, 
        \ 'tabline_subseparator': { 'left': "\ue0b9" , 'right': "\ue0bB" },
        \ 'tabline':{'right':[['rows'],['cd'],['tabopts']]},
        \ 'tab': {'active':['prefix','filename']}
        \}


function! Mymode()
    return  &ft == 'unite' ? 'Unite' :
          \ &ft == 'vimfiler' ? 'VimFiler' :
          \ &ft == 'vimshell' ? 'VimShell' :
          \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
function! MyFilename()
    return  ' ' ! = expand('%:F') ? expand('%:F') : '[No Name]'
endfunction
