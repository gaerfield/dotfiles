#!/usr/bin/env bash

sudo apt-get update \
  && sudo apt-get upgrade -y \
  && sudo apt-get install -y \
    byobu \
    curl \
    file \
    fontconfig \
    git \
    highlight \
    htop \
    iputils-ping \
    jq \
    nano \
    nmap \
    netcat-openbsd \
    rsync \
    sed \
    ssh \
    sudo \
    tmux \
    tree \
    neovim \
    wget \
    fish \
  && sudo apt autoremove -y
