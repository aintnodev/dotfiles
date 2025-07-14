#!/usr/env zsh

# install plugin manager
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
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
export HISTFILE="$XDG_CONFIG_HOME/zsh/.zhistory"
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# source external files
zinit ice wait lucid
zinit snippet $XDG_CONFIG_HOME/zsh/.zshenv
zinit ice wait lucid
zinit snippet $XDG_CONFIG_HOME/zsh/.zaliases

# starship
eval "$(starship init zsh)"

# fzf
eval "$(fzf --zsh)"

# navi
eval "$(navi widget zsh)"

# replace cd with zoxide
eval "$(zoxide init --cmd cd zsh)"

# cd to folder when quitting yazi (terminal file manager)
y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

ZJLAYOUT="$HOME/.local/bin/zjstatus.wasm"
if [[ ! -f "$ZJLAYOUT" ]]; then
  VERSION=$(curl -s "https://api.github.com/repos/dj95/zjstatus/releases/latest" | grep -oP '"tag_name": "\K(.*)(?=")')
  curl -L -o "$ZJLAYOUT" "https://github.com/dj95/zjstatus/releases/download/$VERSION/zjstatus.wasm"
fi

# open a given session in zellij if present, open latest if not or create new
za() {
  if [[ $# -eq 1 ]]; then
    zellij attach "$1"
  else
    local session="$(zellij ls | sed 's/\x1b\[[0-9;]*m//g' | awk 'END {print $1}')"
    if [[ -n "$session" ]]; then
      zellij attach "$session"
    else
      zellij -l welcome
    fi
  fi
}
