eval "$(/opt/homebrew/bin/brew shellenv)"

# source  <(doctl completion zsh)
# Created by `pipx` on 2021-04-17 01:45:52
export PATH="$PATH:/Users/pat/.local/bin"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit

  # ASDF
  . $(brew --prefix asdf)/libexec/asdf.sh

  # The fuck
  if type thefuck &>/dev/null; then
    eval "$(thefuck --alias)"
  fi
fi

alias gs='status'
alias gf='git fetch'
alias gb='git branch'
alias unmerged="git branch --no-merged"
alias plog="git log --oneline --decorate"

