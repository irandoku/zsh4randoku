# zsh4randoku

A fast, customizable zsh framework inspired by zsh4humans, but with starship prompt instead of powerlevel10k.

> **亂讀者的終端機配置** - 把「沒用但有趣」做到位

## Why?

zsh4humans is great, but if you prefer:
- **starship** over powerlevel10k (cross-shell, simpler config)
- **zinit** as plugin manager (turbo mode, lazy loading)
- **More control** over what's loaded and when

...then zsh4randoku might be for you.

## Features

- ⚡ **Fast startup** (<100ms target) with zinit turbo mode
- 🎨 **Rich prompt** via starship (info-heavy style, catppuccin-inspired colors)
- 🔧 **Essential plugins**: syntax-highlighting, autosuggestions, completions
- 🔍 **fzf + fzf-tab**: fuzzy completions with dropdown menu
- 🚀 **Optional integrations**: zoxide (smart cd), atuin (history sync)
- 🔄 **Auto-update**: Like z4h, checks updates every 28 days
- 📦 **Modular**: Load only what you need

## Installation

```bash
git clone https://github.com/randoku/zsh4randoku ~/.zsh4randoku
cd ~/.zsh4randoku
./install.sh
```

Then customize your `~/.zshrc`:

```zsh
# Path to zsh4randoku
export ZSH4RANDOKU_DIR="${HOME}/.zsh4randoku"
source "${ZSH4RANDOKU_DIR}/zsh4randoku.zsh"

# Your personal configs below...
```

## Default Key Bindings

| Key | Action |
|-----|--------|
| `Ctrl+R` | atuin history search |
| `Tab` | fzf-tab dropdown completion |
| `Shift+Tab` | Previous completion |
| `z <dir>` | Jump to directory (zoxide) |
| `zoi` | Interactive directory finder |

## Commands

- `z4r-update` - Update all plugins and check starship
- `zinit update --parallel` - Emergency manual plugin update

## Requirements

- zsh >= 5.8
- git
- curl or wget
- [starship](https://starship.rs/) (auto-installed if missing)
- [fzf](https://github.com/junegunn/fzf) (optional, recommended)

## Structure

```
~/.zsh4randoku/
├── zsh4randoku.zsh      # Main entry
├── lib/
│   ├── bootstrap.zsh    # zinit setup
│   ├── plugins.zsh      # Plugin definitions
│   ├── prompt.zsh       # Starship init
│   └── updater.zsh      # Auto-update logic
├── config/
│   └── starship.toml    # Prompt theme
├── example-zshrc        # Reference config
├── install.sh           # One-line installer
└── README.md
```

## Credits

- Inspired by [zsh4humans](https://github.com/romkatv/zsh4humans) by romkatv
- Plugin manager: [zinit](https://github.com/zdharma-continuum/zinit)
- Prompt: [starship](https://starship.rs/)

## License

MIT - Use at your own risk, have fun! 🐾
