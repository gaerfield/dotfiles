#if zplug check tarruda/zsh-autosuggestions; then
  # ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down) # Add history-substring-search-* widgets t
  # ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}") # Remove *-line-or-history widgets f
  # autosuggest_start # Enable autosuggestions
#fi

# bindkey '^ ' autosuggest-accept
