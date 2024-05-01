# source  <(doctl completion zsh)
# Created by `pipx` on 2021-04-17 01:45:52
export PATH="$PATH:/Users/pat/.local/bin"

# The fuck
if type thefuck &>/dev/null; then
  eval "$(thefuck --alias)"
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit

  # ASDF
  . $(brew --prefix asdf)/libexec/asdf.sh
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
