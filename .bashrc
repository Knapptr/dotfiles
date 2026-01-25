#Testing loading
SHELL=/usr/bin/bash
# Prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\T:\u:\w:[${PS1_CMD1}]> '
#
[[ $- != *i* ]] && return
use_color=true


alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less
alias l.='ls -d .* --color=auto' #TUT
alias ll='ls -l --color=auto' #TUT
alias info='info --vi-keys' #Makes texinfo use vi keys (eg: info sed)
alias rm="rm -i" #confirm delete
alias dfb='dotfilebackup' #backup dotfiles & push to git

xhost +local:root > /dev/null 2>&1



# Node Version Manager N setup
export N_PREFIX="$HOME/nodeVersions"
export PATH="$HOME/:$PATH"
export PATH="$HOME/nodeVersions/bin/:$PATH"

#FZF Completion
# Set up fzf key bindings and fuzzy completion
# eval "$(fzf --bash)"

# These are for WSL
alias hh='cd /mnt/c/Users/knapp'
# alias for windows dev directory
alias dev='cd /mnt/c/Users/knapp/Dev'

# Start tmux if it exists
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


