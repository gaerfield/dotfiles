# CTRL-W deletes word until next slash (instead of space)
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# improved less option
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'

# check zsh-options
# for example: https://github.com/Shougo/shougo-s-github/blob/64d1ff893c12439bb0bfdd30b7e48519f8b5711b/.zshrc

# zsh history
export HISTFILE=$ZSH_CACHE_DIR/history
export HISTSIZE=10000
export SAVEHIST=10000
setopt inc_append_history        # save commands are added to the history immediately, otherwise only when shell exits.
setopt share_history
setopt appendhistory             # Immediately append history instead of overwriting
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt histignorealldups         # If a new command is a duplicate, remove the older one
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

## Options section
unsetopt correct                 # dont auto correct mistakes, never used it
setopt extendedglob              # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                # Case insensitive globbing
setopt numericglobsort           # Sort filenames numerically when it makes sense

# Weitere Optionen
setopt nobeep                    # No beep
setopt interactivecomments       # interactive commands
setopt nocheckjobs               # Don't warn about running processes when exiting
setopt rcexpandparam             # Array expension with parameters
setopt autocd                    # if only directory path is entered, cd there.
setopt noemacs                   # don't know what it's doing, but zargs won't echo errors anymore
