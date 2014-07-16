
PATH="/app/vim/:${PATH}"
function gvim {
	gvim.exe -p --remote-tab-silent `cygpath -aw $*` &
}

if [ "$HOSTNAME" = "PC016AA119" ]; then
	export HTTP_PROXY=http://10.1.8.15:8080
fi
