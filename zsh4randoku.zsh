#!/usr/bin/env zsh
#
# zsh4randoku - A fast, customizable zsh framework
# By: BookishCow (randoku.net)
# 
# Philosophy: zsh4humans feature set + starship prompt + zinit performance
#

# Version
ZSH4RANDOKU_VERSION="0.2.3"
ZSH4RANDOKU_DIR="${ZSH4RANDOKU_DIR:-${HOME}/.zsh4randoku}"

# Source all modules
source "${ZSH4RANDOKU_DIR}/lib/bootstrap.zsh"
source "${ZSH4RANDOKU_DIR}/lib/plugins.zsh"
source "${ZSH4RANDOKU_DIR}/lib/prompt.zsh"
source "${ZSH4RANDOKU_DIR}/lib/updater.zsh"

# Initialize
z4r_bootstrap
z4r_load_plugins
z4r_init_prompt
z4r_schedule_update_check

# Source user config files (if they exist)
# Uses zsh nullglob (N) so no error when no matches
for _z4r_config in "${ZSH4RANDOKU_DIR}/config"/*.zsh(N); do
    source "$_z4r_config"
done
unset _z4r_config
