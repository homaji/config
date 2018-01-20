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

call plug#end()

"Key Config"""
""macvimではoption+\がleaderになるので変更

let g:mapleader = ','

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
