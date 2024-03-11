if not type -q chezmoi
  exit 0
end

if status is-interactive
    # completions for fish
    chezmoi completion fish | source
end
