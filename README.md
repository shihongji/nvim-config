# nvim

Personal Neovim configuration, based on [LazyVim](https://github.com/LazyVim/LazyVim). Synced across machines via this repo.

## Install on a new machine

```sh
git clone git@github.com:shihongji/nvim.git ~/.config/nvim
nvim
```

LazyVim will bootstrap itself and install plugins on first launch (versions pinned by `lazy-lock.json`).

## Layout

- `init.lua` — entry point; bootstraps `lazy.nvim`
- `lua/config/` — core config (options, keymaps, autocmds, lazy setup)
- `lua/plugins/` — plugin specs (colorscheme, markdown preview, Java, Scala, …)
- `lazy-lock.json` — pinned plugin versions; commit after `:Lazy update`
- `lazyvim.json` — LazyVim extras/options
- `.neoconf.json` — neoconf LSP settings
- `stylua.toml` — Lua formatter config
- `spell/en.utf-8.add` — custom spellcheck dictionary (added via `zg`); `.spl` binary is generated locally and gitignored
- `mkdp/vue.css` — custom CSS for `markdown-preview.nvim`
- `.claude/` — Claude Code project settings (local file gitignored)

## Syncing

After changes:

```sh
git add -A && git commit -m "..." && git push
```

On the other machine:

```sh
git -C ~/.config/nvim pull
```
