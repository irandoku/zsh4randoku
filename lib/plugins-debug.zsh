#!/usr/bin/env zsh
#
# DEBUG Minimal plugins - for freeze diagnosis
#

z4r_load_plugins() {
    echo "[z4r] Loading minimal plugins for debugging..."
    
    # Only syntax highlighting - safest plugin
    zinit ice wait"0" lucid
    zinit light zsh-users/zsh-syntax-highlighting
    
    # Skip everything else for diagnosis
    echo "[z4r] Minimal plugins loaded."
}
