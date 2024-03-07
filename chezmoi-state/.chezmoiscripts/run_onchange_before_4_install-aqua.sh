#!/usr/bin/env bash

# aqua already installed?
command -v aqua >/dev/null 2>&1 && { exit 0; }

curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.3.0/aqua-installer
echo "1577b99b74751a5ddeea757198cee3b600fce3ef18990540e4d0e667edcf1b5f  aqua-installer" | sha256sum -c
chmod +x aqua-installer
./aqua-installer
rm ./aqua-installer
#/home/user/.local/share/aquaproj-aqua/aqua install