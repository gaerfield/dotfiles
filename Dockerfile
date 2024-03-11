ARG VERSION=stable
FROM debian:${VERSION}

ARG PUSERNAME=user
ARG PUID=1000
ARG PGID=1000
ARG TERM=xterm-256color
ARG DOTFILE_FEATURE_TOGGLES=

ENV PUSERNAME=${PUSERNAME} PUID=${PUID} PGID=${PGID} \
    SHELL=/usr/bin/fish TERM=${TERM} \ 
    DOTFILE_FEATURE_TOGGLES=${DOTFILE_FEATURE_TOGGLES} \
    PATH=$XDG_BIN_HOME:$PATH \
    DEFAULT_USER=${PUSERNAME} \
    EDITOR=/usr/bin/nvim

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     # required by curl chezmoi
     ca-certificates \
     curl \
     # required by chezmoi install script (and usually comes preinstalled)
     sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

#RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
#  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
#  && apt-get update -y && apt-get install google-cloud-sdk -y

RUN chsh -s /usr/bin/fish && \
    printf "${PUSERNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user && \
    mkdir /docker-entrypoint-initdb.d && \
    adduser --disabled-password --shell /usr/bin/fish --uid "${PUID}" --home "/home/${PUSERNAME}" --gecos '' "${PUSERNAME}" && \
    mkdir --mode 0777 /init

# uncomment if you want to use your local files to build the image
COPY . /home/${PUSERNAME}/.local/share/chezmoi/
RUN chown -R ${PUSERNAME}:${PUSERNAME} /home/${PUSERNAME} 

WORKDIR /home/${PUSERNAME}
USER ${PUSERNAME}

# chezmoi
RUN mkdir -p ~/.local/bin && \
   # sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply gaerfield
   # sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init gaerfield && ~/.local/bin/chezmoi git -- checkout switch-to-zim && ~/.local/bin/chezmoi apply
   # uncomment if you want to use your local files to build the image
   sh -c "$(curl -fsLS get.chezmoi.io) -b ." && ./chezmoi init && ./chezmoi apply && rm ./chezmoi \
   && rm -rf ~/\$XDG_CACHE_HOME

RUN mkdir /init/home-${PUSERNAME} && rsync -a ~/ /init/home-${PUSERNAME}/ && rm -rf ~/*

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sleep", "infinity"]
