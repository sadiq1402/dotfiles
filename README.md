# dotfiles

Personal config for my Omarchy (Hyprland/Arch) machine. Plain copies, no symlinks/stow —
each app's folder mirrors its real path relative to `$HOME`.

## Layout

```
bash/.bashrc                          personal aliases + git aliases + ble.sh wiring
nvim/.config/nvim/                    LazyVim install + personal overrides (options, keymaps, LSP extras)
tmux/.config/tmux/tmux.conf           Omarchy tmux config + tpm plugins
alacritty/.config/alacritty/alacritty.toml
lazygit/.config/lazygit/config.yml
btop/.config/btop/btop.conf
git/.config/git/config
starship/.config/starship.toml
```

## Restoring on a new machine

Copy each app's files back to their real location, e.g.:

```sh
cp bash/.bashrc ~/.bashrc
cp -r nvim/.config/nvim ~/.config/nvim
cp tmux/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
cp alacritty/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
cp lazygit/.config/lazygit/config.yml ~/.config/lazygit/config.yml
cp btop/.config/btop/btop.conf ~/.config/btop/btop.conf
cp git/.config/git/config ~/.config/git/config
cp starship/.config/starship.toml ~/.config/starship.toml
```

Notes:
- nvim requires [LazyVim](https://www.lazyvim.org/) bootstrapping — on first launch it will
  clone `lazy.nvim` and install plugins automatically.
- tmux requires [tpm](https://github.com/tmux-plugins/tpm) at `~/.tmux/plugins/tpm`, then
  `prefix + I` inside tmux to install plugins.
- `~/.bashrc` assumes an Omarchy base install (sources `$OMARCHY_PATH/default/bash/rc`) and
  `blesh` installed via the AUR for autosuggestions — install that separately if needed.
