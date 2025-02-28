#!/usr/env zsh

# default apps
export EDITOR=helix
export VISUAL=helix
export PAGER=less

# default folders
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# add ~/.local/bin and subfolders to $PATH
export PATH="$PATH:${$(find ~/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

# add ~/.yarn/bin to $PATH
export PATH="$(yarn global bin):$PATH"

# add ~/.go/bin to $PATH
export GOPATH=$HOME/.go/bin
export PATH="$GOPATH:$PATH"

# add pyenv to $PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# zeditor native window decorations (make sure to edit
# /usr/share/applications/dev.zed.Zed.desktop as well)
export ZED_WINDOW_DECORATIONS=server

# define path for starship config
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# use bat as a colorizing pager
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# set the localization
# export LC_ALL=en_IN.UTF-8
