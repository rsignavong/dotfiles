export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%d/%m/%y %T "

# Promptline
source ~/.shell_prompt.sh

bind "set completion-ignore-case on"

shopt -s checkwinsize

eval "$(rbenv init -)"

export NVM_DIR="/Users/Rocky/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tmux
[[ $TERM != "screen" ]] && tmux

# cargo
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# Rust source
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

