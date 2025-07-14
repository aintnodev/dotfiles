## Getting Started

1. Clone the repo in the `$HOME` directory.
2. Run `stow .` from the root of the repo.

```sh
# Install GNU Stow
paru -S stow

# Change directory to repo's root directory
cd dotfiles

# Create symlinks to configuration files
stow .
```

## Configuration

### OS Specific (Arch Linux)

#### Paru (AUR Helper)

Enable colors in `/etc/pacman.conf` to enable colors in Paru.

```sh
# Install required packages
sudo pacman -S --needed base-devel

# Clone the repo in your home directory
git clone https://aur.archlinux.org/paru.git

# Change directory to the root of the repo
cd paru

# Compile and install the package
makepkg -si
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

EDITOR=helix sudoedit /etc/systemd/resolved.conf

# Restart the systemd-resolved service
sudo systemctl restart systemd-resolved
```

#### Insults

Append `Defaults insults` in the `/etc/sudoers`.

```sh
# Open /etc/sudoers using visudo
EDITOR=helix sudo sudoedit
```

### Git (VCS)

GitHub can be set-up to use ssh keys, see this: [github/auth/ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), and [add ssh key to GitHub](https://github.com/settings/keys).

```sh
# Generate new ssh key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add ssh key to ssh-agent
ssh-add ~/.ssh/id_ed25519
```

### Helix (Text Editor)

Refer to the following: [helix/docs](https://docs.helix-editor.com/lang-support.html), [helix/fmt](https://github.com/helix-editor/helix/wiki/External-formatter-configuration) and [helix/lsp](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations).

```sh
# Install Helix
paru -S helix

# Install LSPs
npm i -g bash-language-server\
  svelte-language-server\
  @tailwindcss/language-server\
  typescript-language-server\
  vscode-langservers-extracted\
  yaml-language-server@next

paru -S clang marksman python-lsp-server rust-analyzer taplo texlab

# Install formatters
paru -S prettier shfmt
```

### Kanata (Key Mapper)

Assuming you have created symlinks for the configuration file, follow the steps as mentioned in [kanata/linux-setup](https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md) for more info.

### Yazi (File Manager)

Refer to the following: [yazi/resources](https://yazi-rs.github.io/docs/resources).

```sh
# Install the file manager
paru -S yazi

# Install all yazi plugins
ya pack -i

# Install previewers
paru -S 7zip ffmpeg poppler imagemagick chafa

# Install other utils
paru -S fd ripgrep fzf zoxide
```

### Zsh (Shell)

Install `zsh` and `starship` and you're good to go.

```sh
# Install Zsh and Starship
paru -S zsh starship

# Change default shell to ZSH (logout for changes to take effect)
sudo chsh -s $(which zsh)
```

### User Apps

````sh
# Enable flatpaks
paru -S flatpak

# Essential flatpaks
flatpak install flathub app.zen_browser.zen\
  org.kde.KStyle.Adwaita\
  org.kde.WaylandDecoration.QAdwaitaDecorations

# Essential apps
paru -S chromium discord foliate fragments ghostty gnome-boxes impression kdenlive krita zed

# Awesome CLI apps
paru -S android-tools bat btop cowsay dust entr eza fd figlet fzf httpie lazygit lolcat macchina miller ouch ripgrep starship tldr yazi yt-dlp zellij zoxide ```
````
