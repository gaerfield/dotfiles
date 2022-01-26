ARG VERSION=latest
FROM debian:stable

ARG PUSERNAME=user
ARG PUID=1000
ARG PGID=1000
ARG TERM=xterm-256color
ARG ZINIT_ZSH_VERSION

ENV PUSERNAME=${PUSERNAME} PUID=${PUID} PGID=${PGID} \
    SHELL=/bin/zsh TERM=${TERM} ZINIT_ZSH_VERSION=${ZINIT_ZSH_VERSION} \
    PROFILES="git-extras kubernetes docker" \
    ISTIO_VERSION="1.11.4" \
    K8S_VERSION="v1.21.5" \
    PATH=$XDG_BIN_HOME:$PATH \
    DEFAULT_USER=${PUSERNAME} \
    EDITOR=/usr/bin/vim

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
    apt-transport-https \
    bsdmainutils \
    byobu \
    coreutils \
    ca-certificates \
    curl \
    dnsutils \
    file \
    git \
    gnupg \
    iputils-ping \
    libxml2-utils \
    make \
    nano \
    nmap \
    netcat \
    rsync \
    sed \
    sudo \
    tmux \
    tree \
    neovim \
    wget \
    zsh \
  # zsh-build-tools
  && apt-get install -y \
    autoconf bash build-essential ncurses-dev

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
  && apt-get update -y && apt-get install google-cloud-sdk -y

RUN chsh -s /bin/zsh && \
    printf "${PUSERNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user && \
    mkdir /docker-entrypoint-initdb.d && \
    adduser --disabled-password --shell /bin/zsh --uid "${PUID}" --home "/home/${PUSERNAME}" --gecos '' "${PUSERNAME}" && \
    mkdir --mode 0777 /init  

# uncomment if you want to use your local files to build the image
# COPY . /home/${PUSERNAME}/.local/share/chezmoi/
# RUN chown -R ${PUSERNAME}:${PUSERNAME} /home/${PUSERNAME} 

WORKDIR /home/${PUSERNAME}
USER ${PUSERNAME}

RUN mkdir -p ~/.local/bin && \
   sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply gaerfield && rm -rf ~/bin && \
   # uncomment if you want to use your local files to build the image
   # sh -c "$(curl -fsLS chezmoi.io/get) -b ." && ./chezmoi init && ./chezmoi apply && rm ./chezmoi && \
   ZSH_NO_INIT=1 zsh -ils -c -- '@zinit-scheduler burst'
RUN mkdir -p ~/.cache/nvim/undo ~/.cache/nvim/swap ~/.cache/nvim/backup ~/.cache/nvim/view && XDG_CACHE_HOME=/home/${PUSERNAME}/.cache nvim +'PlugInstall --sync' +qa
RUN mkdir /init/home-${PUSERNAME} && rsync -a ~/ /init/home-${PUSERNAME}/ && rm -rf ~/*

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sleep", "infinity"]
