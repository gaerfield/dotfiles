#!/usr/bin/env bash

mkdir -p ~/.cache/nvim/undo ~/.cache/nvim/swap ~/.cache/nvim/backup ~/.cache/nvim/view
nvim +silent +PlugUpdate +PlugUpgrade +qa >> /dev/null
