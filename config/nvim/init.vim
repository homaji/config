"Default Setting
"" Config PATH 
let $XDG_CONFIG_HOME=$HOME.'/.config'
let $VIM_PLUG = $XDG_CONFIG_HOME.'/nvim/plugged'
set rtp^=$XDG_CONFIG_HOME,$VIM_PLUG
let g:python3_host_prog = '/usr/local/bin/python3'

""Vim-Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'Shougo/vimproc'
Plug 'Shougo/denite.nvim'
Plug 'tyru/eskk.vim'
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-quickrun'
Plug 'yuratomo/w3m.vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

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

""Change ¥ to BackSlash
noremap! ¥ \
noremap! \ ¥

""Cursol move
set whichwrap=b,s,h,l,<,>,[,],~

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>m %

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

""Background
set background=dark

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
 imap <C-^> <Plug>(eskk:enable)
 if has('vim_starting')
 let g:eskk#directory= '~/.config/nvim/eskk/'
 let g:eskk#dictionary= {
			 \'path': '~/.config/nvim/eskk/skk-jisyo.utf8',
			 \'encoding': 'utf-8'
			 \}
 let g:eskk#large_dictionary = {
			 \'path': '~/.config/nvim/eskk/SKK-JISYO.L',
			 \'encoding': 'EUC-JP'
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
        \    'bufnum': 'Mybufnum',
        \    'winnum': 'Mywinnum',
        \    'tabnum': 'Mytabnum', 
        \ },
         \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6" }, 
        \ 'subseparator': { 'left': "\ue0b5", 'right': "\ue0b7" },
        \ 'tabline_separator': { 'left': "\ue0b8", 'right': "\ue0bA" }, 
        \ 'tabline_subseparator': { 'left': "\ue0b9" , 'right': "\ue0bB" },
        \ 'tabline':{'right':[['winnum'],['tabnum'],['bufnum']]},
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

function! Mybufnum()
        let str = "B" . bufnr('%') . "/" . bufnr('$')
        return str
endfunction

function! Mytabnum()
        let str = "T" . tabpagenr( ) . "/" . tabpagenr('$')
        return str
endfunction

function! Mywinnum()
        let str = "W" . winnr( ) . "/" . winnr('$')
        return str
endfunction


""quickrun.vim""
""" 新しいウィンドウを下に開く
set splitbelow

""Deoplete.nvim""
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
"let g:deoplete#sources#jedi#python_path = ~/.pyenv/shims/python3 
"""<TAB>: completion
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\S'
endfunction"}}}

""ALE""
""" mark on error line"""
"using Cica font 0xf467
let g:ale_sign_error = ' '
"using Cica font 0xf46e k
let g:ale_sign_warning =' '

""" message format fot error lines
let g:ale_echo_msg_format = '[%linter%] %s {%severity%}'
""" always ON error
let g:ale_sign_column_always = 1

""" excute lint when file openning
let g:ale_lint_on_enter = 1
""" excute lint when file saving
let g:ale_lint_on_save = 1

""" Don't use QuickFix
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

""" filetype for lint
let g:ale_linters = {
            \   'python': ['flake8'],
            \}
""" keymapping for lint
nmap [ale] <Nop>
map <C-k> [ale]

"""" jump to error line
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)
