#!/usr/bin/env zsh
#
# zsh4randoku Installer
#

set -e

ZSH4RANDOKU_URL="https://github.com/randoku/zsh4randoku"
ZSH4RANDOKU_DIR="${HOME}/.zsh4randoku"

echo "🚀 Installing zsh4randoku..."

# Check dependencies
check_deps() {
    local missing=()
    
    if ! (( $+commands[git] )); then
        missing+=("git")
    fi
    
    if ! (( $+commands[curl] )) && ! (( $+commands[wget] )); then
        missing+=("curl or wget")
    fi
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        echo "❌ Missing dependencies: ${missing[*]}"
        exit 1
    fi
}

# Backup existing zshrc
backup_zshrc() {
    if [[ -f ~/.zshrc ]]; then
        echo "📦 Backing up existing .zshrc to .zshrc.backup.$(date +%Y%m%d)"
        cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d)
    fi
}

# Note: Individual tool install functions are in lib/ directory
# - z4r_install_starship() in lib/bootstrap.zsh
# - Others are handled by install_tools() below

# Install recommended tools
install_tools() {
    local tools=("starship" "fzf" "zoxide" "atuin" "direnv")
    
    echo "📦 Installing recommended tools..."
    
    if (( $+commands[brew] )); then
        for tool in "${tools[@]}"; do
            if ! (( $+commands[$tool] )); then
                echo "   Installing $tool..."
                brew install "$tool" 2>/dev/null || echo "   ⚠️ $tool install failed or skipped"
            fi
        done
    else
        echo "⚠️  Homebrew not found. Please install manually:"
        echo "   https://starship.rs/"
        echo "   https://github.com/junegunn/fzf"
        echo "   https://github.com/ajeetdsouza/zoxide"
        echo "   https://github.com/atuinsh/atuin"
        echo "   https://direnv.net/"
    fi
}

# Main installation
main() {
    check_deps
    backup_zshrc
    
    # Create directory structure
    mkdir -p "${ZSH4RANDOKU_DIR}"
    
    echo "✅ zsh4randoku structure created at ${ZSH4RANDOKU_DIR}"
    
    # Install recommended tools (starship, zoxide, atuin, direnv, fzf)
    install_tools
    
    # Create example zshrc if none exists
    if [[ ! -f ~/.zshrc ]]; then
        cp "${ZSH4RANDOKU_DIR}/example-zshrc" ~/.zshrc
        echo "✅ Created ~/.zshrc from example"
    fi
    
    echo ""
    echo "🎉 zsh4randoku installation complete!"
    echo ""
    echo "Next steps:"
    echo "  1. Customize ~/.zshrc with your settings"
    echo "  2. Run 'source ~/.zshrc' to activate"
    echo "  3. Enjoy your new prompt!"
    echo ""
    echo "Useful commands:"
    echo "  z4r-update    - Update all plugins"
    echo "  z4h           - Shortcut to zinit commands"
}

main
