# Setup fzf
# ---------
FZF_REPO="$ZPLUG_REPO/repos/junegunn/fzf"
FZF_BINPATH="$ZPLUG_REPO/bin/"
FZF_MANPATH="$FZF_REPO/man"

if [[ ! "$PATH" =~ "$FZF_BINPATH" ]]; then
  export PATH="$PATH:$FZF_BINPATH"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "$FZF_MANPATH" && -d "$FZF_MANPATH" ]]; then
  export MANPATH="$MANPATH:$FZF_MANPATH"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "$FZF_REPO/shell/completion.zsh"

# Key bindings
# ------------
source "$FZF_REPO/shell/key-bindings.zsh"

# TAB-Completion
# --------------
#source "$ZPLUG_REPO/repos/changyuheng/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh"

export FZF_DEFAULT_OPTS='
  --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
  --color info:136,prompt:136,pointer:230,marker:230,spinner:136
'

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS='--sort'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# mehr fzf: https://github.com/junegunn/fzf/wiki/Examples
