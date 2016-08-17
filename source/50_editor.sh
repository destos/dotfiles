# Editing

if [[ ! "$SSH_TTY" && "$OSTYPE" =~ ^darwin ]]; then
  export EDITOR='atom -w'
  export LESSEDIT='atom'
  alias s='atom'
else
  export EDITOR=$(which vi vim nano pico 2>/dev/null | sed 's/ .*$//;q')
  alias e="$EDITOR -w -z"
fi

export VISUAL="$EDITOR"

alias a.='atom .'

function qs() {
  pwd | perl -ne"s#^$(echo ~/.dotfiles)## && exit 1" && cd ~/.dotfiles
  s ~/.dotfiles
}

# set line editor to vim
set -o vi
