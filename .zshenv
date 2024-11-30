# ~/.zshenv

# default apps
export EDITOR=helix
export VISUAL=helix
export PAGER=less

# default folders
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.config/nvm"

# adds ~/.local/bin and subfolders to $PATH
export PATH="$PATH:${$(find ~/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

# zeditor native window decorations (make sure to edit
# /usr/share/applications/dev.zed.Zed.desktop as well)
export ZED_WINDOW_DECORATIONS=server

# set the localization
# export LC_ALL=en_IN.UTF-8
