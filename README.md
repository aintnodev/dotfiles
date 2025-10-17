## Setup

**GNU Stow** is used to symlink dotfiles. You can install it via package manager of your choice, then run `stow .` from root of the cloned repository to symlink config files.
necessarily

**Home Manager** is used to install some packages, though it's not necessarily required and you can choose to skip this.

```sh
# Install Nix package manager
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon

# Install and switch Home Manager configuration
nix-shell -p home-manager -c "home-manager switch"
```

## Configuration

**GitHub:** GitHub can be set-up to use ssh keys, see this: [github/auth/ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), and [add ssh key to GitHub](https://github.com/settings/keys).

**Helix:** Refer to the following: [helix/docs](https://docs.helix-editor.com/lang-support.html), [helix/fmt](https://github.com/helix-editor/helix/wiki/External-formatter-configuration) and [helix/lsp](https://github.com/helix-editor/helix/wiki/Language-Server-Configurations).

To set helix as defualt editor on Ubuntu, run `sudo update-alternatives --install /usr/bin/editor editor (which hx) 100`

**Kanata:** Assuming you have created symlinks for the configuration file, follow the steps as mentioned in [kanata/linux-setup](https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md) for more info.

**Yazi:** Refer to the following: [yazi/resources](https://yazi-rs.github.io/docs/resources).
