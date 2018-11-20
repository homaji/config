echo "~/.bash_profile loaded"

export LANG="ja_JP.UTF-8"

#export PYENV_ROOT="${HOME}/.pyenv/"
#export PATH="${PYENV_ROOT}/bin:$PATH"
#eval "$(pyenv init -)"
export XDG_CONFIG_HOME="${HOME}/.config/"

#export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$XDG_CONFIG_HOME/tmux_bin/:$PATH"

# set prompt
## \[ ... \] : encloses control sequence with \[ and \] for accurate word wrap
## \033[xxm : changes the color of command line
## \h : the hostname up to the first "."
## \w : current working directory
## \n : newline
## \$ : "$" for non-root, "#" for root
## カラー説明https://qiita.com/fernet/items/4dcb6f82520d87227121
export PS1='\[\e[36m\][\h: \w]\[\e[0m\]\n\$'

# set TMUX
# SESSION_NAME=ope
# 
# if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
# 	option=""
# 	if tmux has-session -t ${SESSION_NAME}; then
# 		option="attach -t ${SESSION_NAME}"
# 	else
# 		option="new -s ${SESSION_NAME}"
# 	fi
# 	tmux $option && exit
# fi
