if empty(globpath(&rtp, 'autoload/lightline.vim'))
    finish
endif

""lightline""
set laststatus=2
let g:lightline = { 
        \'colorscheme': 'iceberg'
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
         \ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba" }, 
        \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb" },
        \ 'tabline_separator': { 'left': "\ue0bc", 'right': "\ue0be" }, 
        \ 'tabline_subseparator': { 'left': "\ue0bd" , 'right': "\ue0bf" },
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
