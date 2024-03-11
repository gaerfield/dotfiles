if type -q chezmoi && status is-interactive
    chezmoi completion fish | source    # completions for fish
end
