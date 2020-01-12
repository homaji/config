"""Display Setting

"Cursol
set number
set cursorline

"number
"set relativenumber

""ColorScheme
"let scheme = 'iceberg'
let scheme = 'solarized'
set background=dark

autocmd  WinLeave * set nocursorline 
autocmd  WinEnter * set cursorline 

""Font Cica 
if has('win32')||('win64')
    set guifont=Cica:h12:b
    set guifontwide=Cica:h12:b
elseif has('mac')||('unix')
    set guifont=Cica:h18
    set guifontwide=Cica:h18
    set ambiwidth=double
endif
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
