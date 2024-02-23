if not type -q istioctl
  exit 0
end

set -x ISTIO_CLI_BINARIES_LOCATION $XDG_DATA_HOME/istio

if status is-interactive
  set ISTIO_BINARY $XDG_BIN_HOME/istioctl
  
  function istio-download
    set --local ISTIO_VERSION $argv
    set --local TARGET_FILE "$ISTIO_CLI_BINARIES_LOCATION/istioctl-$ISTIO_VERSION"

    if not test -d $ISTIO_CLI_BINARIES_LOCATION
        mkdir -p $ISTIO_CLI_BINARIES_LOCATION
    end
    
    curl -Ls "https://github.com/istio/istio/releases/download/$ISTIO_VERSION/istioctl-$ISTIO_VERSION-linux-amd64.tar.gz" | tar -xz -O > "$TARGET_FILE"
    chmod +x $TARGET_FILE
    echo $TARGET_FILE
  end

  function istio-switch
    set --local ISTIO_VERSION $argv
    set --local TARGET_FILE "$ISTIO_CLI_BINARIES_LOCATION/istioctl-$ISTIO_VERSION"

    if test -f $TARGET_FILE
      ln -sf $ISTIO_CLI_BINARIES_LOCATION/istioctl-$argv $ISTIO_BINARY
    else
      echo "ERROR: [$TARGET_FILE] does not exist"
    end
  end
  
  alias istio-list="ls $ISTIO_CLI_BINARIES_LOCATION"
  alias istio-bin="ls -al $ISTIO_BINARY"

  if test -f $ISTIO_BINARY
    istioctl completion fish | source
  end
end