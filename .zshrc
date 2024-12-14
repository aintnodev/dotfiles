# ~/.zshrc

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# load ohmyzsh plugins
# zinit snippet OMZP::colorize
# zinit snippet OMZP::thefuck
# zinit snippet OMZP::vi-mode

# load remote plugins
zinit load zsh-users/zsh-syntax-highlighting
# zinit load zsh-users/zsh-history-substring-search
zinit load marlonrichert/zsh-autocomplete
zinit load zsh-users/zsh-autosuggestions

# source external files
source $HOME/.zaliases
source $HOME/.zshenv

# cd to folder when quitting yazi (terminal file manager)
y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# wl copy from stdin
ccp() {
  if [ -f "$1" ]; then
    cat "$1" | wl-copy
    echo "Contents of '$1' copied to clipboard."
  else
    echo "File '$1' does not exist."
    return 1
  fi
}

# ohmyposh
# eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/ohmyposh/theme.toml)"

# starship
eval "$(starship init zsh)"

# zsh configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
# setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

# load nvm annd nvm bash_completion
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
