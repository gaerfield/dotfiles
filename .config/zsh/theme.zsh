POWERLEVEL9K_INSTALLATION_PATH=~/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator vcs)
# turn off lock icon, but keep the red background color to indicate readOnly
POWERLEVEL9K_LOCK_ICON=''
# turn off icons, takes to much space
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

# Hide succesful status
POWERLEVEL9K_STATUS_VERBOSE=FALSE
# Limit to the last two folders
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# truncate_middle     = truncate middle-part
# truncate_from_right = OR from right, leaving the first X characters untouched
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
