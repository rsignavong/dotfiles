if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew update
brew upgrade

# Install packages
# rargs must be installed with cargo

apps=(
  ack
  bash-completion2
  bat
  bats
  battery
  cmake
  coreutils
  crystal-lang
  diff-so-fancy
  dockutil
  erlang
  elixir
  elm
  exa
  fd
  ffmpeg
  fasd
  fzf
  gifsicle
  git
  git-extras
  gnu-sed --with-default-names
  grep --with-default-names
  hub
  httpie
  imagemagick
  jq
  lynx
  mackup
  macvim
  nano
  pandoc
  psgrep
  python
  reattach-to-user-namespace
  ripgrep
  shellcheck
  ssh-copy-id
  sbdchd/skim/skim
  tig
  tmux
  the_silver_searcher
  tree
  unar
  vim --with-override-system-vi
  wget
  wifi-password
  xsv
  zsh
)

brew install "${apps[@]}"
# $(brew --prefix)/opt/fzf/install

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
