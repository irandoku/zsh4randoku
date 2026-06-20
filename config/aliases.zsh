# eza aliases (only if eza is installed)
if (( $+commands[eza] )); then
    alias ls='eza --icons --color=auto'
    alias ll='eza --icons --color=auto -la'
    alias la='eza --icons --color=auto -a'
    alias lt='eza --icons --color=auto -T'
fi
