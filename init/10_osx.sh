# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681
# https://github.com/mxcl/homebrew/issues/10245
if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
  sudo xcode-select -switch /usr/bin
fi

# Install Homebrew.
if [[ ! "$(which brew)" ]]; then
  e_header "Installing Homebrew"
  true | /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ "$(which brew)" ]]; then
  e_header "Updating Homebrew Cask Apps"
  brew update

  # Install Homebrew recipes.
  recipes=(git tree sl lesspipe nmap git-extras htop-osx man2html wget caskroom/cask/brew-cask hub tmux pyenv pyenv-virtualenvwrapper gawk reattach-to-user-namespace autoenv thefuck)

  list="$(to_install "${recipes[*]}" "$(brew list)")"
  if [[ "$list" ]]; then
    e_header "Installing Homebrew recipes: $list"
    brew install $list
  fi

  cask_apps=(launchrocket alfred virtualbox google-chrome firefox iterm2 shortcat onepassword vlc hammerspoon dash)
  cask_list="$(to_install "${cask_apps[*]}" "$(brew cask list)")"
  if [[ "$cask_list" ]]; then
    e_header "Installing Applications via cask : $cask_list"
    brew cask install $cask_list
  fi

  if [[ ! "$(which gcc-4.2)" ]]; then
    e_header "Installing Homebrew dupe recipe: apple-gcc42"
    brew install https://raw.github.com/Homebrew/homebrew-dupes/master/apple-gcc42.rb
  fi
fi

# Disable press and hold accent menu
defaults write -g ApplePressAndHoldEnabled -bool false
