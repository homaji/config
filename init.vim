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
