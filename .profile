# set the localization
export LC_ALL=en_IN.UTF-8

# default folders
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# zeditor native window decorations
export ZED_WINDOW_DECORATIONS=server

export PATH="$PATH:/home/ishu/.local/share/JetBrains/Toolbox/scripts"

# start required services
exec ssh-agent zsh
