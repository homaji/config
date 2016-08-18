
""runtimepath
  let $MY_VIMRUNTIME = $HOME.'.vim'
  let $VIMPLUG= $MY_VIMRUNTIME . '/plugged'
  set rtp+=$MY_VIMRUNTIME,$VIMPLUG

""Vim-Plug
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-plug',{'dir': '~/.vim/plugged/autoload'}
	Plug 'Shougo/unite.vim'
	Plug 'Shougo/vimproc'
	Plug 'Shougo/neomru.vim'
	Plug 'thinca/vim-quickrun'
	Plug 'itchyny/lightline.vim'
	Plug 'rhysd/clever-f.vim'
call plug#end()

if has('win32')||('win64')
	let g:vimproc#download_windows_dll =1
endif
