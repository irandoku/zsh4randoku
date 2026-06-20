# Double-ESC to prepend sudo to current command line
# Toggle: press again to remove sudo
_z4r_sudo_command_line() {
    [[ -z $BUFFER ]] && return
    if [[ $BUFFER == sudo\ * ]]; then
        # Already has sudo, remove it
        BUFFER="${BUFFER#sudo }"
    else
        BUFFER="sudo $BUFFER"
    fi
    CURSOR=${#BUFFER}
}
zle -N _z4r_sudo_command_line
bindkey '\e\e' _z4r_sudo_command_line