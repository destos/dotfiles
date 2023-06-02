# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="robbyrussell"
# ZSH_THEME="kennethreitz"
# ZSH_THEME="steeef"
# ZSH_THEME="jbergantine"
# ZSH_THEME="nebirhos"
# ZSH_THEME="random"
# ZSH_THEME="suvash"
# ZSH_THEME="sorin"
ZSH_THEME="re5et"

# Vim style shortcuts
bindkey -v

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Hide/show all desktop icons (useful when presenting)
# alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
# alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Show/hide hidden files in Finder
# alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
# alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

plugins=(thefuck git git-extras vscode iterm2 brew macos tmux git-flow wd poetry docker docker-compose 1password)
# pat-git-aliases

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/.bin:$HOME/.poetry/bin

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit

# Created by `pipx` on 2021-04-17 01:45:52
export PATH="$PATH:/Users/pat/.local/bin"
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
