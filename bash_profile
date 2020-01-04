echo "~/.bash_profile loaded"

export LANG="ja_JP.UTF-8"
export HISTFILE="$HOME"temp/bash_history
export XDG_CONFIG_HOME="$HOME"config
export XDG_CACHE_HOME="$HOME".cache
export XDG_DATA_HOME="$HOME".local/share

export PATH=$XDG_CONFIG_HOME/tmux_bin/:$PATH
export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"

# set env for JUPYTER_NOTEBOOK
export JUPYTER_NOTEBOOK_ROOT="${HOME}/data/dev/python/"

# set prompt
## \[ ... \] : encloses control sequence with \[ and \] for accurate word wrap
## \033[xxm : changes the color of command line
## \h : the hostname up to the first "."
## \w : current working directory
## \n : newline
## \$ : "$" for non-root, "#" for root
## カラー説明https://qiita.com/fernet/items/4dcb6f82520d87227121
export PS1='\[\e[36m\][\h: \w]\[\e[0m\]\n\$'

set TMUX
if [ "$TERM_PROGRAM" = "alacritty" ]; then
 SESSION_NAME=ope
 
 if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
 	option=""
 	if tmux has-session -t ${SESSION_NAME}; then
 		option="attach -t ${SESSION_NAME}"
 	else
 		option="new -s ${SESSION_NAME}"
 	fi
 	tmux $option && exit
 fi
fi
