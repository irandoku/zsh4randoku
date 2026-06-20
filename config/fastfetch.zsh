# fastfetch: show system info on first interactive shell (skip tmux panes)
# Only runs if fastfetch is installed and not inside tmux
if (( $+commands[fastfetch] )) && [[ -z "$TMUX" ]]; then
    fastfetch
fi