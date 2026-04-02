# Prompt Wizardry
#PROMPT="%K{green}%n @ %m %K{magenta}%F{green}❯%f%~ %#%k"
# I stole this prompt from "Bread on Penguins", a linux influencer. I have no shame.
NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{#2E3440}%F{#E5E9F0}%t %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ "
#########################################
# Node Version Manager N setup
export N_PREFIX="$HOME/Dependencies/Node/"

# set scriptdirectory
export SCRIPTS=$HOME/scripts

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# tmux sessionizer from the primeagen
alias tm=~/tmux_sessionizer


