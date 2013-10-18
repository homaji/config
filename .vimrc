
"""Basic Config"""
set nocompatible
set backup
set backupdir=$HOME/.vimtemp

"Use Clipboard"
set clipboard=unnamed,autoselect
"""Key Config"""
"macvimではoption+¥がleaderになるので変更
let g:mapleader = ','
"map ¥ <leader>

"CurrentDirectory"
"http://blog.blueblack.net/item_317
augroup BufferAu
	autocmd!
	autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif

"runtimepath
if isdirectory($HOME . '.vim')
  let $MY_VIMRUNTIME = $HOME.'.vim'
elseif isdirectory($HOME . 'vimfiles')
  let $MY_VIMRUNTIME = $HOME.'vimfiles'
elseif isdirectory($VIM . 'vimfiles')
  let $MY_VIMRUNTIME = $VIM.'vimfiles'
endif
""StatusLine""
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"""Plugin Configrations"""

"for Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Shougo/git-vim'
Bundle 'thinca/vim-quickrun'

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

