## Setup

1. Clone the repo in `$HOME` directory.
2. Run `stow .` from root of the repo.

```sh
# Install GNU Stow
paru -S stow

# Change directory to repo's root directory
cd dotfiles

# Create symlinks of configuration files
stow .
```

## Configuration

**GitHub:** GitHub can be set-up to use ssh keys, see this: [github/auth/ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), and [add ssh key to GitHub](https://github.com/settings/keys).

**Helix:** Refer to the following: [helix/docs](https://docs.helix-editor.com/lang-support.html), [helix/fmt](https://github.com/helix-editor/helix/wiki/External-formatter-configuration) and [helix/lsp](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations).

**Kanata:** Assuming you have created symlinks for the configuration file, follow the steps as mentioned in [kanata/linux-setup](https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md) for more info.

**Yazi:** Refer to the following: [yazi/resources](https://yazi-rs.github.io/docs/resources).
