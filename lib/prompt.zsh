#!/usr/bin/env zsh
#
# zsh4randoku Prompt - Starship initialization
#

z4r_init_prompt() {
    # Ensure starship is installed
    if ! (( $+commands[starship] )); then
        if (( $+commands[brew] )); then
            echo "📦 zsh4randoku: Installing starship via Homebrew..."
            brew install starship
        elif (( $+commands[cargo] )); then
            echo "📦 zsh4randoku: Installing starship via cargo..."
            cargo install starship --locked
        else
            echo "⚠️  zsh4randoku: Starship not found. Please install manually:"
            echo "   brew install starship  # macOS"
            echo "   or visit https://starship.rs/guide/"
        fi
    fi
    
    # Initialize starship
    if (( $+commands[starship] )); then
        eval "$(starship init zsh)"
        
        # Export config path
        export STARSHIP_CONFIG="${HOME}/.zsh4randoku/config/starship.toml"
    fi
}
