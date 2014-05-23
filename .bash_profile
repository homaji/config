
PATH="/app/vim/:${PATH}"
function gvim {
	gvim.exe -p --remote-tab-silent `cygpath -aw $*` &
}
