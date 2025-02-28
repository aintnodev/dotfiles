#!/usr/env zsh

# install plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# source zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light marlonrichert/zsh-autocomplete
zinit light zsh-users/zsh-completions

# load completions
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# zsh configuration
export HISTSIZE=100000
export SAVEHIST=20000
export HISTFILE="$HOME/.config/zsh/.zhistory"
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# source external files
zinit ice wait lucid
zinit snippet $HOME/.config/zsh/.zshenv
zinit ice wait lucid
zinit snippet $HOME/.config/zsh/.zaliases

# starship
eval "$(starship init zsh)"

# fzf
eval "$(fzf --zsh)"

# replace cd with zoxide
eval "$(zoxide init --cmd cd zsh)"

# pyenv
eval "$(pyenv init - zsh)"

# cd to folder when quitting yazi (terminal file manager)
y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

za() {
  local session="$(zellij ls | sed 's/\x1b\[[0-9;]*m//g' |
    awk 'END {print $1}')"
  zellij attach "$session"
}
