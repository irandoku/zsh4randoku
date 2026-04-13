#!/usr/bin/env zsh
#
# zsh4randoku Bootstrap - zinit installation and initialization
#

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install starship if not present
z4r_install_starship() {
    if ! (( $+commands[starship] )); then
        echo "📦 zsh4randoku: Installing starship..."
        if (( $+commands[brew] )); then
            brew install starship
        elif (( $+commands[cargo] )); then
            cargo install starship --locked
        else
            # Direct install via script
            curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir="$HOME/.local/bin"
        fi
    fi
}

# Check and install zinit if needed
z4r_bootstrap() {
    if [[ ! -d "$ZINIT_HOME" ]]; then
        echo "📦 zsh4randoku: Installing zinit..."
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    fi
    
    # Source zinit
    source "${ZINIT_HOME}/zinit.zsh"
    
    # Enable turbo mode for faster startup
    zinit ice depth=1
}
