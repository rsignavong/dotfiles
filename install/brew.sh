if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew tap cjbassi/ytop
brew tap clementtsang/bottom
brew tap brandonskerritt/rustscan
brew update
brew upgrade

# Install packages
# rargs must be installed with cargo

apps=(
  ack
  ansible
  austinjones/taps/tab
  autozimu/homebrew-formulas/unison-fsmonitor
  bandwhich
  bash-completion2
  bat
  bats
  battery
  bottom
  cmake
  coreutils
  crystal-lang
  ctags
  diff-so-fancy
  datawire/blackbird/telepresence
  dockutil
  dotenv-linter/tap/dotenv-linter
  erlang
  elixir
  exa
  extrawurst/tap/gitui
  fd
  ffmpeg
  ffsend
  fasd
  fzf
  fontforge
  gifsicle
  git
  git-absorb
  git-delta
  git-extras
  gitui
  gnu-sed --with-default-names
  grep --with-default-names
  gstreamer
  heroku/brew/heroku
  hub
  httpie
  hyperfine
  imagemagick
  jq
  just
  kafkacat
  kubectx
  kubernetes-cli
  llvm
  lynx
  lsd
  mackup
  macvim
  michaeleisel/zld/zld
  minikube
  nano
  neovim
  nushell
  nvm
  pack
  packer
  pandoc
  procs
  psgrep
  python
  reattach-to-user-namespace
  ripgrep
  rustscan
  sbt
  sccache
  shellcheck
  sk
  ssh-copy-id
  sbdchd/skim/skim
  starship
  terraform
  tig
  tmux
  the_silver_searcher
  tokei
  tree
  unar
  unison
  vim --with-override-system-vi
  wget
  wifi-password
  xsv
  ytop
  zenith
  zoxide
  zsh
)

brew install "${apps[@]}"
# $(brew --prefix)/opt/fzf/install

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
