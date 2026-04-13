#!/usr/bin/env zsh
#
# fzf-tab configuration
# Loaded after plugins via zinit atload
#

# Space key to accept selection
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'

# Use fzf --preview for extra info
zstyle ':fzf-tab:*' fzf-pad 4

# Don't show preview for simple files
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -la $realpath 2>/dev/null | head -20'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'cat ${realpath} 2>/dev/null | head -20'

echo "[z4r] fzf-tab config loaded"
