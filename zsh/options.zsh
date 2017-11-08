# export EDITOR=vim
# export LANG=en_US.UTF-8

# CTRL-W deletes word until next slash (instead of space)
 WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# improved less option
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'

# check zsh-options
# for example: https://github.com/Shougo/shougo-s-github/blob/64d1ff893c12439bb0bfdd30b7e48519f8b5711b/.zshrc

# zsh history
export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history
setopt share_history
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.


# Weitere Optionen
setopt no_beep
setopt EXTENDED_GLOB
