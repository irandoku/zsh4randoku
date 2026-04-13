#!/usr/bin/env zsh
#
# zsh4randoku - A fast, customizable zsh framework
# By: BookishCow (randoku.net)
# 
# Philosophy: zsh4humans feature set + starship prompt + zinit performance
#

# Version
ZSH4RANDOKU_VERSION="0.1.0"
ZSH4RANDOKU_DIR="${HOME}/.zsh4randoku"

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
