# tmux

This configuration uses a top status line with the Catppuccin Mocha theme,
battery and CPU indicators, and fuzzy tmux-session switching.

## Install

Run the repository installer from its root:

```sh
./install.sh
```

It installs the command-line dependencies, backs up an existing tmux
configuration, links `tmux/.tmux.conf` to `~/.tmux.conf`, and installs TPM.
TPM installs:

- `catppuccin/tmux`
- `tmux-plugins/tmux-battery`
- `tmux-plugins/tmux-cpu`

## Key bindings

- `Ctrl-a r`: reload `~/.tmux.conf`.
- `Ctrl-a s`: search and switch tmux sessions with `sesh` and `fzf`.
- `Ctrl-a |`: split the active pane horizontally.
- `Ctrl-a -`: split the active pane vertically.
- `Ctrl-a h`, `j`, `k`, `l`: select a pane.

The status line is ASCII-only, so a Nerd Font is not required.
