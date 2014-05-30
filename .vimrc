""NeoBundle
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
	\'build' : {
	\	'mac' : 'make -f make_mac.mak',
	\	'windows' : 'make -f make_mingw32.mak',
	\	'cygwin' : 'make -f make_cygwin.mak',
	\	'unix' : 'make -f make_unix.mak'
	\	},
	\}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'deton/jasegment.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'basyura/jslint.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'JavaScript-Indent'
NeoBundle 'smartchr'
NeoBundle 'vim-scripts/spec.vim'
NeoBundle 'vim-scripts/project.tar.gz'
filetype plugin on 
filetype indent on "Required!


"""Basic Config"""
set backup
set backupdir=$HOME/.vimtemp
set directory=$HOME/.vimtemp
"Use Clipboard"
set clipboard=unnamed,autoselect

""Encoding""
scriptencoding utf-8
set encoding=utf-8
""Japanese enviroment""
"http://magicant.txt-nifty.com/main/2009/03/vim-modeline-fi.html
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

""Show Invisible Characters""
set list
set listchars=tab:▸\ ,trail:_
	
""AutoChangeDirectory
au BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))

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
"s+qQ kill buffer or window
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

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

""Vim-Over""
"Highlight subsutitute"
let g:over_enable_cmd_window = 1

""quickrun.vim""
" 新しいウィンドウを下に開く
set splitbelow

""vimfiler""
"auto
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit 
"set default explor open in :e .
let g:vimfiler_as_default_explorer = 1
"set Safemode off
let g:vimfiler_safe_mode_by_default=0

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
		\ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
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

