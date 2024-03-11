(( ${+commands[fzf]} )) || exit 0

export FZF_DEFAULT_OPTS='
  --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
  --color info:136,prompt:136,pointer:230,marker:230,spinner:136
'

export FZF_CTRL_T_COMMAND='rg --files --no-messages'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS='--sort'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export FZF_MARKER_COMMAND_COLOR='\x1b[38;5;249m'
export FZF_MARKER_COMMENT_COLOR='\x1b[38;5;32m'
export FZF_MARKER_MAIN_KEY='\C-@'
export FZF_MARKER_PLACEHOLDER_KEY='\C-v'