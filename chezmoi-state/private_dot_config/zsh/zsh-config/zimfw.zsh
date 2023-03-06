# Applies correct bindkeys for input events.
zmodule input
# Sets a custom terminal title.
zmodule termtitle
# Utility aliases and functions. Adds colour to ls, grep and less.
# zmodule utility
zmodule junegunn/fzf --fpath shell/completions.zsh --source shell/key-bindings.zsh

# movement with "z"
zmodule agkozak/zsh-z

zmodule joke/zim-chezmoi

zmodule $ZDOTDIR/local-modules/tealdeer
zmodule $ZDOTDIR/local-modules/aqua
zmodule $ZDOTDIR/local-modules/direnv-hook
zmodule $ZDOTDIR/local-modules/kubernetes
zmodule $ZDOTDIR/local-modules/github-cli
zmodule $ZDOTDIR/local-modules/gcloud
zmodule $ZDOTDIR/local-modules/vscodium
zmodule $ZDOTDIR/local-modules/podman

# Prompt
zmodule romkatv/powerlevel10k --use degit

# Completion

# load extra completions
zmodule $ZSH_EXTRA_COMPLETIONS_DIR --fpath .
# Additional completion definitions for Zsh.
zmodule zsh-users/zsh-completions --fpath src
# Enables and configures smart and extensive tab completion.
# completion must be sourced after all modules that add completion definitions.
zmodule completion

# Modules that must be initialized after compinit last
zmodule Aloxaf/fzf-tab # after compinit but before syntax-highlighting and autosuggestions
zmodule zsh-users/zsh-syntax-highlighting
zmodule zsh-users/zsh-history-substring-search
zmodule zsh-users/zsh-autosuggestions

