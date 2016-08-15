"	""NeoBundle
"	set nocompatible
"	filetype off
"
"	if has('vim_starting')
"		set runtimepath+=~/.vim/bundle/neobundle.vim
"	endif
"	call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc', {
"	\'build' : {
"	\	'mac' : 'make -f make_mac.mak',
"	\	'windows' : 'make -f make_mingw32.mak',
"	\	'cygwin' : 'make -f make_cygwin.mak',
"	\	'unix' : 'make -f make_unix.mak'
"	\	},
"	\}
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/tabpagebuffer.vim'
"NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'rhysd/clever-f.vim'
"NeoBundle 'deton/jasegment.vim'
"NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'basyura/jslint.vim'
"NeoBundle 'glidenote/memolist.vim'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'JavaScript-Indent'
"NeoBundle 'smartchr'
"NeoBundle 'vim-scripts/spec.vim'
"NeoBundle 'vim-scripts/project.tar.gz'
"NeoBundle 'itchyny/calendar.vim'
"NeoBundle 'mattn/webapi-vim'
"NeoBundle 'mattn/vimplenote-vim'
"NeoBundle 'haya14busa/incsearch.vim'
"NeoBundle 'open-browser.vim'
"NeoBundle 'superbrothers/vim-vimperator'
"
"call neobundle#end()

if has('vim_starting')
	set rtp+=~/.vim/plugged/vim-plug
	if !isdirectory(expand('~/.vim/plugged/vim-plug'))
		echo 'install vim-plug...'
		call system('mkdir -p ~/.vim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
	end
endif

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-plug',{'dir': '~/.vim/plugged/vim-plug/autoload'}
call plug#end()

filetype plugin on 
filetype indent on "Required!


"""Basic Config"""
set backup
set backupdir=$HOME/.vim/vimtemp
set directory=$HOME/.vim/vimtemp
set viminfo+=n$HOME/.vim/viminfo.txt

"Use Clipboard"
set clipboard=unnamed,autoselect

""Encoding""
scriptencoding utf-8
set encoding=utf-8
""Japanese enviroment""
"http://magicant.txt-nifty.com/main/2009/03/vim-modeline-fi.html
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

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

""Buffer
set hidden

""AutoChangeDirectory
au BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))

""set Wildmode. Bash like complement
set wildmode=list:longest

""Using with Cygwin"
" VIM faq-33.6
" https://github.com/Shougo/shougo-s-github/blob/master/vim/rc/windows.rc.vim
if has('win32') || has('win64')
	set shellcmdflag=-c
	set shellxquote=\"
	set shell=bash.exe
	set shellpipe=2>&1\|\ tee
	set shellredir=>%s\ 2>&1
	set grepprg=grep
endif

"""Key Config"""
"macvimではoption+\がleaderになるので変更
let g:mapleader = ','
"map \ <leader>

"move to other Windows
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

"Change yank key. Yank from cursol to line end.
"http://itchyny.hatenablog.com/entry/2014/12/25/090000
nnoremap Y y$

"ESC in insert-mode
inoremap jk <ESC>

""Edit .vimrc""
"http://whileimautomaton.net/2008/08/vimworkshop3-kana-presentation
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>
""Reload .vimrc""
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

"runtimepath
if isdirectory($HOME . '.vim')
  let $MY_VIMRUNTIME = $HOME.'.vim'
elseif isdirectory($HOME . 'vimfiles')
  let $MY_VIMRUNTIME = $HOME.'vimfiles'
elseif isdirectory($VIM . 'vimfiles')
  let $MY_VIMRUNTIME = $VIM.'vimfiles'
endif
""StatusLine""
""set laststatus=2
""set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"""Plugin Configrations"""

""Changelog""
let g:changelog_username = "homaji"
let g:changelog_timeformat = "%Y-%m-%d"
"au BufNewFile,BufRead *.changelog setf changelog 
runtime vimfiles/ftplugin/changelog.vim


""Spec""
"http://nanasi.jp/articles/vim/spec_vim.html
let spec_chglog_format = "%c homaji"
au BufNewFile,BufRead *.changelog setf spee
noremap <Leader>c <Plug>SpecChangelog

""Clever-f"
"大文字を入力したときだけ、大文字小文字を区別
let g:clever_f_smart_case = 1
"migemoっぽい検索
let g:clever_f_use_migemo = 1

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



""vimfiler""
"auto
"autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit 
"set default explor open in :e .
let g:vimfiler_as_default_explorer = 1
"set Safemode off
let g:vimfiler_safe_mode_by_default=0
"Edit file by tabedit
let g:vimfiler_edit_action='tabopen'

""Project.vim""
".projectvimがそのフォルダにあれば自動で読み込み
"Vimテクニックバイブルより
if getcwd() != $HOME
	if filereadable(getcwd(). '/.vimprojects')
		Project .vimprojects
	endif
endif
"Projectをトグルで開閉
:nmap <silent> <Leader>p <Plug>ToggleProject

""Calendar.vim
:nmap <silent> <Leader>c :<C-u>Calendar -view=year -split=vertical -width=27<CR>


""smartchr""
inoremap <expr> = smartchr#loop('=', ' = ', ' == ')

""memolist""
let g:memolist_path = "$HOME/data/doc/lifelog"
let g:memolist_unite = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-start-insert"


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
	

""incSearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

""OpenBrowser
"nmap <Leader>o <Plug>(openbrowser-open)
"vmap <Leader>o <Plug>(openbrowser-open)

nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

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

