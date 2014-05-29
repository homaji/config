colorscheme desert

"Hide menu and Tool bar 
nnoremap <silent> <C-F2> :<C-u>call <SID>toggle_guioptions()<CR> 

function! s:toggle_guioptions()
	if &guioptions =~# 'T' 
		set guioptions-=T 
		set guioptions-=m 
	else 
		set guioptions+=T 
		set guioptions+=m 
	endif 
endfunction
