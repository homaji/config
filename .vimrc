
""runtimepath
if has('win32')||('win64')
  let $MY_VIMRUNTIME = $HOME.'.vim'
elseif has('mac')
  let $MY_VIMRUNTIME = $HOME.'/.vim'
end
  let $VIMPLUG= $MY_VIMRUNTIME . '/plugged'
  set rtp^=$MY_VIMRUNTIME,$VIMPLUG

""Vim-Plug
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-plug'
	Plug 'Shougo/unite.vim'
	Plug 'Shougo/vimproc'
	Plug 'Shougo/neomru.vim'
	Plug 'thinca/vim-quickrun'
	Plug 'thinca/vim-qfreplace'
	Plug 'itchyny/lightline.vim'
	Plug 'rhysd/clever-f.vim'
""About Python
	Plug 'davidhalter/jedi-vim'
call plug#end()

if has('win32')||('win64')
	let g:vimproc#download_windows_dll =1
endif


"""Basic Config"""
filetype plugin on 
filetype indent on 
syntax on

set backup
set backupdir=$MY_VIMRUNTIME/vimtemp
set directory=$MY_VIMRUNTIME/vimtemp
set undodir=$MY_VIMRUNTIME/vimtemp
set viminfo+=n$MY_VIMRUNTIME/viminfo.txt

"Use Clipboard"
set clipboard=unnamed,autoselect

""Buffer
set hidden

""set Wildmode. Bash like complement
set wildmode=list:longest

"""Key Config"""

""Change <Leader>
"macvimではoption+\がleaderになるので変更
let g:mapleader = ','
"map \ <leader>

""move to other Windows
"http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
"s+hjkl move to window
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
"s+nptT move to tab
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
"s+sv split window
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
"s+bB use Unite buffers
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
nnoremap sf :<C-u>Unite file_mru<CR>
"s+qQ kill buffer or window
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

""Change yank key. Yank from cursol to line end.
"http://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap Y y$

""ESC in insert-mode
inoremap jk <ESC>

""Edit .vimrc""
"http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
""Reload .vimrc""
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

"""Display Setting

""Show Invisible Characters""
"http://qiita.com/X___MOON___X/items/26d3f292537bad197f64
map <silent> <F3> :set list!<CR>
set list
set listchars=tab:>_,trail:_

""Show all lines
"http://itchyny.hatenablog.com/entry/2014/12/25/090000
set display=lastline

""Set Tab line
"http://d.hatena.ne.jp/thinca/20111204/1322932585
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
set noexpandtab

"""Plugin Setting

""Unite""
let g:unite_split_rule = "botright"
let g:unite_winheight= 20
let g:unite_data_directory = $HOME.'/.vim/cache/unite'
let g:neomru#file_mru_path = $HOME.'/.vim/cache/neomru/file'
let g:neomru#directory_mru_path = $HOME.'/.vim/cache/neomru/directory'

""lightline""
let g:lightline = { 
		\'colorscheme': 'wombat'
		\,
		\'active': {
		\  'left':[ ['mode', 'paste'], ['readonly','modified'],['filename'] ],
		\  'right':[ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ],
		\},
		\'component_function': {
		\    'mode': 'Mymode',
		\ },
 		\ 'separator': { 'left': "\u2b80", 'right': "\u2b82" }, 
		\ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
		\ 'tabline_separator': { 'left': "|", 'right': "|" }, 
		\ 'tabline_subseparator': { 'left': "|" , 'right': "|" } 
		\}

let g:lightline.tabline = {'right':[['rows'],['cd'],['tabopts']]}
let g:lightline.tab = {'active':['prefix','filename']}
let g:lightline.tab.inactive = g:lightline.tab.active

function! Mymode()
	return  &ft == 'unite' ? 'Unite' :
	      \ &ft == 'vimfiler' ? 'VimFiler' :
	      \ &ft == 'vimshell' ? 'VimShell' :
	      \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
function! MyFilename()
	return  ' ' ! = expand('%:F') ? expand('%:F') : '[No Name]'
endfunction

""Changelog""
let g:changelog_username = "homaji"
let g:changelog_timeformat = "%Y-%m-%d"

""quickrun.vim""
" 新しいウィンドウを下に開く
set splitbelow

"
"quickrun for sql
let g:quickrun_config = {}
let g:quickrun_config['sql'] = {
		\ 'command': 'mysql',
		\ 'exec': ['%c  %o < %s'],
		\ 'cmdopt': '%{MakeMySQLCommandOptions()}'
		\}

let g:mysql_config_host = '10.211.55.6'
let g:mysql_config_port = ''
let g:mysql_config_user = 'homaji'
function! MakeMySQLCommandOptions()
	if !exists("g:mysql_config_host")
		let g:mysql_config_host = input("host> ")
	endif
	if !exists("g:mysql_config_port")
		let g:mysql_config_port = input("port> ")
	endif
	if !exists("g:mysql_config_user")
		let g:mysql_config_user = input("user> ")
	endif
	if !exists("g:mysql_config_pass")
		let g:mysql_config_pass = input("password> ")
	endif
	if !exists("g:mysql_config_db")
		let g:mysql_config_db = input("database> ")
	endif
	
	let optlist = []
	if g:mysql_config_user != ''
		call add(optlist, '-u ' . g:mysql_config_user)
	endif
	if g:mysql_config_host != ''
		call add(optlist, '-h ' . g:mysql_config_host)
	endif
	if g:mysql_config_pass != ''
		call add(optlist, '-p' . g:mysql_config_pass)
	endif
	if g:mysql_config_port != ''
		call add(optlist, '-P ' . g:mysql_config_port)
	endif
	if exists("g:mysql_config_otheropts")
		call add(optlist, g:mysql_config_otheropts)
	endif

    call add(optlist, g:mysql_config_db)
    return join(optlist, ' ') 
endfunction
""Clever-f"
"大文字を入力したときだけ、大文字小文字を区別
let g:clever_f_smart_case = 1
"migemoっぽい検索
let g:clever_f_use_migemo = 1


"""Function
""Scouter
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)

