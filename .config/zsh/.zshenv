#!/usr/env zsh

# default apps
export EDITOR=helix
export VISUAL=helix
export PAGER=less

# add ~/.cargo/bin to $PATH
export PATH="$HOME/.cargo/bin:$PATH"

# add ~/.local/bin and subfolders to $PATH
export PATH="$PATH:${$(find $HOME/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

# add ~/.yarn/bin to $PATH
export PATH="$(yarn global bin):$PATH"

# add ~/.local/share/pnpm to $PATH
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# update GOPATH
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# add pyenv to $PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# define path for starship config
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# use bat as a colorizing pager
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
