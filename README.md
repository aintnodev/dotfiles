## Getting Started

1. Clone the repo in the `$HOME` directory.
2. Run `stow .` from the root of the repo.

```sh
# Change directory to user's home directory
$ cd

# Install GNU Stow
$ paru -S stow

# Change directory to repo's root directory
$ cd dotfiles

# Create symlinks to configuration files
$ stow .
```

## Configuration

### OS Specific (Arch Linux)

#### Paru (AUR Helper)

Enable colors in `/etc/pacman.conf` to enable colors in Paru.

```sh
# Install required packages
$ sudo pacman -S --needed base-devel

# Clone the repo in your home directory
$ git clone https://aur.archlinux.org/paru.git

# Change directory to the root of the repo
$ cd paru

# Compile and install the package
$ makepkg -si
```

#### DNS

Grab your's from [NextDNS](https://my.nextdns.io/start) or use any other DNS resolver

```sh
# Paste the following text into the config file
# Should be like format below

# [Resolve]
# DNS=1.1.1.1
# DNS=1.0.0.1
# DNS=2606:4700:4700::1111
# DNS=2606:4700:4700::1001
# DNSOverTLS=yes

$ EDITOR=helix sudoedit /etc/systemd/resolved.conf

# Restart the systemd-resolved service
$ sudo systemctl restart systemd-resolved
```

#### Insults

Append `Defaults insults` in the `/etc/sudoers`.

```sh
# Open /etc/sudoers using visudo
$ EDITOR=helix sudo sudoedit
```

### Git (VCS)

```sh
# Install Git Credential Manager
$ paru -S git-credential-manager-bin

# Set GCM as credential helper (globally)
$ git config --global credential.helper manager
```

### Helix (Text Editor)

Refer to the following: [helix/docs](https://docs.helix-editor.com/lang-support.html), [helix/fmt](https://github.com/helix-editor/helix/wiki/External-formatter-configuration) and [helix/lsp](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations).

```sh
# Install the text editor
$ paru -S helix

# Install the LSPs
$ paru -S ansible-language-server bash-language-server clang gopls lua-language-server marksman python-lsp-server rust-analyzer taplo texlab typescript-language-server vscode-css-languageserver vscode-html-languageserver vscode-json-languageserver yaml-language-server

# Install the formatters
$ paru -S prettier shfmt
```

### Kanata (Key Mapper)

Assuming you have created symlinks for the configuration file, follow the steps as mentioned in [kanata/linux-setup](https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md) for more info.

### Yazi (File Manager)

Refer to the following: [yazi/resources](https://yazi-rs.github.io/docs/resources).

```sh
# Install the file manager
$ paru -S yazi

# Install all yazi plugins
$ ya pack -i

# Install the previewers
$ paru -S 7zip ffmpeg poppler imagemagick chafa

# Install other utils
$ paru -S fd ripgrep fzf zoxide
```

### ZSH (Shell)

Install `thefuck` and `starship` and you're good to go.

```sh
# Install ZSH
$ paru -S zsh

# Install The Fuck and Starship
$ paru -S thefuck starship

# Change default shell to ZSH (logout for changes to take effect)
$ sudo chsh -s $(which zsh)
```
