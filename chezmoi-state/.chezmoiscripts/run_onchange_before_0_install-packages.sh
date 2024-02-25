#!/usr/bin/env bash

sudo apt-get update \
  && sudo apt-get upgrade -y \
  && sudo apt-get install -y \
    byobu \
    curl \
    file \
    fontconfig \
    git \
    jq \
    nmap \
    netcat-openbsd \
    rsync \
    sed \
    ssh \
    tmux \
    tree \
    neovim \
    watch \
    wget \
    fish \
  && sudo apt autoremove -y
