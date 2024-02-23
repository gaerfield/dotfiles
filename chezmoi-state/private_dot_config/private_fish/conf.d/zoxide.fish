if not type -q zoxide
  exit 0
end

if status is-interactive
    zoxide init fish | source           # load z autojump plugin
end