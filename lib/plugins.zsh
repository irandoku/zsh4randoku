#!/usr/bin/env zsh
#
# zsh4randoku Plugins - Load all plugins with zinit turbo mode
# FIXED: Removed conflicting zsh-autocomplete, deduplicated compinit
#

z4r_load_plugins() {
    # Essential: syntax highlighting (load first)
    zinit ice wait"0" lucid
    zinit light zsh-users/zsh-syntax-highlighting
    
    # Essential: autosuggestions (start manually at end of function)
    zinit ice wait"0" lucid
    zinit light zsh-users/zsh-autosuggestions
    
    # Essential: completions (provides additional completion scripts)
    # zsh-completions doesn't need the 'blockf' for zinit turbo
    zinit ice wait"0" lucid
    zinit light zsh-users/zsh-completions
    
    # fzf: completion and key bindings
    # Note: 'wait' defers loading until prompt is ready (no 0 delay)
    zinit ice wait lucid src"shell/completion.zsh" blockf
    zinit light junegunn/fzf
    
    zinit ice wait lucid src"shell/key-bindings.zsh"
    zinit light junegunn/fzf
    
    # fzf-tab: Turn native Tab completion into fzf dropdown menu
    # Compatible alternative to zsh-autocomplete
    zinit ice wait"1" lucid
    zinit light Aloxaf/fzf-tab
    
    # Native zsh completion with compinit (call only ONCE)
    # zsh-users plugins populate fpath, then compinit builds cache
    autoload -Uz compinit
    # Only regenerate .zcompdump once per day (speeds up startup)
    if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
        compinit
    else
        compinit -C
    fi
    
    # Optional: zoxide (smart cd) - if installed
    # Use --no-cmd to avoid conflict with zinit (which uses 'zi')
    if (( $+commands[zoxide] )); then
        eval "$(zoxide init zsh --no-cmd)"
        # Create z and zoi aliases (zinit takes 'zi')
        alias z='__zoxide_z'
        alias zoi='__zoxide_zi'
    fi
    
    # Optional: atuin (shell history) - if installed
    if (( $+commands[atuin] )); then
        eval "$(atuin init zsh)"
    fi
    
    # Optional: direnv - if installed
    if (( $+commands[direnv] )); then
        eval "$(direnv hook zsh)"
    fi
    
    # Start autosuggestions manually (safer than atload hook)
    if (( $+functions[_zsh_autosuggest_start] )); then
        _zsh_autosuggest_start
    fi
    
    echo "[z4r] Plugins loaded successfully"
}

# === Directory navigation with Shift+Arrow keys ===
# Moved here but NOT inside the function, so it's sourced once

_z4r_cd_up() { cd .. && zle reset-prompt }
_z4r_cd_back() { popd >/dev/null 2>&1 || cd - && zle reset-prompt }
_z4r_cd_forward() { 
    # Simplified forward navigation
    local next_dir=$(dirs -p | sed -n '2p')
    if [[ -n "$next_dir" && -d "$next_dir" ]]; then
        pushd "$next_dir" >/dev/null 2>&1 && zle reset-prompt
    fi
}
_z4r_cd_down() {
    local dir=$(ls -d */ 2>/dev/null | head -1)
    if [[ -n "$dir" ]]; then
        cd "$dir" && zle reset-prompt
    fi
}

zle -N _z4r_cd_up
zle -N _z4r_cd_down
zle -N _z4r_cd_back
zle -N _z4r_cd_forward

# Shift+Arrow bindings (macOS terminal sequences)
bindkey '\e[1;2A' _z4r_cd_up      # Shift+Up
bindkey '\e[1;2B' _z4r_cd_down    # Shift+Down  
bindkey '\e[1;2D' _z4r_cd_back    # Shift+Left
bindkey '\e[1;2C' _z4r_cd_forward # Shift+Right
