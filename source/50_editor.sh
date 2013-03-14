# Editing

if [[ ! "$SSH_TTY" && "$OSTYPE" =~ ^darwin ]]; then
  export EDITOR='mate -w'
  export LESSEDIT='mate %f'
  alias m='mate'
else
  export EDITOR=$(which vi vim nano pico 2>/dev/null | sed 's/ .*$//;q')
  alias e="$EDITOR -w -z"
fi

export VISUAL="$EDITOR"

alias m.='m .'

function qs() {
  pwd | perl -ne"s#^$(echo ~/.dotfiles)## && exit 1" && cd ~/.dotfiles
  m ~/.dotfiles
}
