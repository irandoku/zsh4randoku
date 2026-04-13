#!/usr/bin/env zsh
#
# zsh4randoku Updater - Periodic auto-update mechanism
#

ZSH4RANDOKU_UPDATE_DAYS=28
ZSH4RANDOKU_LAST_UPDATE_FILE="${HOME}/.zsh4randoku/.last_update"

z4r_schedule_update_check() {
    # Check for update on startup (non-blocking)
    {
        if [[ -f "$ZSH4RANDOKU_LAST_UPDATE_FILE" ]]; then
            local last_update=$(cat "$ZSH4RANDOKU_LAST_UPDATE_FILE")
            local days_since=$(( ($(date +%s) - last_update) / 86400 ))
            
            if (( days_since >= ZSH4RANDOKU_UPDATE_DAYS )); then
                z4r_update
            fi
        else
            # First run, record current date
            date +%s > "$ZSH4RANDOKU_LAST_UPDATE_FILE"
        fi
    } &!
}

z4r_update() {
    echo "🔄 zsh4randoku: Checking for updates..."
    
    local zinit_dir="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
    
    # Update zinit
    if [[ -d "$zinit_dir" ]]; then
        (cd "$zinit_dir" && git pull --quiet)
    fi
    
    # Update all zinit plugins
    zinit update --parallel --quiet
    
    # Record update time
    date +%s > "$ZSH4RANDOKU_LAST_UPDATE_FILE"
    
    echo "✅ zsh4randoku: Update complete!"
}

# Manual update command
alias z4r-update=z4r_update
