if empty(globpath(&rtp, 'autoload/vimade.vim'))
    finish
endif

let g:vimade = {}
let g:vimade.fadelevel = 0.3
let g:vimade.enaglesigns = 1
