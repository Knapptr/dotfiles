#Testing loading
# VIM OR VIM
if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi
# These are for WSL
alias hh='cd /mnt/c/Users/knapp'
# alias for windows dev directory
alias dev='cd /mnt/c/Users/knapp/Dev'

# Start tmux if it exists
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


