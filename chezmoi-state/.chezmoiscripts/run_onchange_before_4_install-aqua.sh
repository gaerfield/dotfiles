#!/usr/bin/env bash

# aqua already installed?
command -v aqua >/dev/null 2>&1 && { exit 0; }

curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.3.0/aqua-installer
echo "1577b99b74751a5ddeea757198cee3b600fce3ef18990540e4d0e667edcf1b5f  aqua-installer" | sha256sum -c
chmod +x aqua-installer
./aqua-installer
rm ./aqua-installer

# first time installation - aqua.yaml is not yet in the correct path, explicitely define the location
export PATH=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH
export AQUA_CONFIG="$HOME/.local/share/chezmoi/chezmoi-state/aqua.yaml"

aqua install