echo "~/.bash_profile loaded"

export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

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
