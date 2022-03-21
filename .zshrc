# macOS paths
if [[ $OSTYPE == 'darwin'* ]]
then
    # https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
    # Clear PATH before path_helper executes; will prevent it from prepending the default
    # PATH to your (previously) chosen PATH
    if [ -f /etc/profile ]; then
        PATH=""
        source /etc/profile
    fi
    export PATH="/Applications/SnowSQL.app/Contents/MacOS:$PATH"
    export PATH="/usr/bin:$PATH"
    export PATH="/bin:$PATH"
    export PATH="/usr/sbin:$PATH"
    export PATH="/sbin:$PATH"
    export PATH="/usr/local:$PATH"
    export PATH="/usr/local/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    eval $(/opt/homebrew/bin/brew shellenv)

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/Users/erik/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/erik/mambaforge/etc/profile.d/conda.sh" ]; then
            . "/Users/erik/mambaforge/etc/profile.d/conda.sh"
        else
            export PATH="/Users/erik/mambaforge/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
# Amazon Linux 2 paths
else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/mambaforge/etc/profile.d/conda.sh" ]; then
            . "/opt/mambaforge/etc/profile.d/conda.sh"
        else
            export PATH="/opt/mambaforge/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi

DISABLE_MAGIC_FUNCTIONS=true

setopt AUTO_CD

# Set key binding
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Enable globbing
setopt extended_glob

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Disable case-sensitive globbing
unsetopt CASE_GLOB

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Oh-my-zsh plugins live in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(tmux docker docker-compose zsh-syntax-highlighting zsh-autosuggestions gitfast)

ZSH_DISABLE_COMPFIX="true"
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Pure theme
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=$
LIGHTGREY=default
zstyle :prompt:pure:user color $LIGHTGREY
zstyle :prompt:pure:host color $LIGHTGREY
zstyle :prompt:pure:virtualenv color $LIGHTGREY
prompt pure

# Set default editor to vim
export EDITOR=$(which vim)

# Source aliases
source $HOME/.aliases

# Set all path entries to unique
# https://til.hashrocket.com/posts/7evpdebn7g-remove-duplicates-in-zsh-path
typeset -aU path

# Do not correct variables to dotfile versions
CORRECT_IGNORE_FILE=".*"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

# Add GPG key
export GPG_TTY=$(tty)
#
# # Enable command completion for AWS CLI 2
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
