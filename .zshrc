# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/knapptr/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# This removes the @prompt when logged on to own machine
DEFAULT_USER="knapptr" 

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Node Version Manager N setup
export N_PREFIX="$HOME/nodeVersions"
export PATH="$HOME/:$PATH"
export PATH="$HOME/nodeVersions/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# adds scripts
export PATH="$HOME/scripts:$PATH"


 #Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias hh="cd /mnt/c/Users/knapp"
alias dev="cd /mnt/c/Users/knapp/Dev"

alias cal-add="~/scripts/calendarScripts/cal-add.sh"
alias cal-rm="~/scripts/calendarScripts/remove-cal.sh"
# alias syn="~/scripts/syn"
#Alias to make egrep standard
alias grep="egrep"
#use human readable ls
alias "ls -l"="ls -lh"
#camp leslie alias
alias cl="cd /mnt/c/Users/knapp/Documents/Camp\ Leslie"

#tmux ide layout
alias ide="tmux split-window -h -p 30 \; split-window -f -p 15"
#ripgrep smart case by default
alias rg="rg -S"
#cal to ncal-b
alias cal="ncal -b"
# python to python3
alias python="python3"
# WSL
#open explorer to current folder
alias xp="explorer.exe ."
# windows desktop
desktop="/mnt/c/Users/knapp/Desktop"
# windows downloads
downloads="/mnt/c/Users/knapp/Downloads"
# windows home
chome="/mnt/c/Users/knapp"
alias ff="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
export BROWSER="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
export ESCDELAY=100
export FZF_DEFAULT_COMMAND='rg --files -S --hidden'
export MANWIDTH=80
alias mm="~/man-pop"



# enable fzf keybinds
source /usr/share/doc/fzf/examples/key-bindings.zsh
# enable fzf fuzzy completion
source /usr/share/doc/fzf/examples/completion.zsh
# tmux sessionizer from the primeagen
alias tm=~/tmux_sessionizer

alias luamake=/home/knapptr/lua-language-server/3rd/luamake/luamake
