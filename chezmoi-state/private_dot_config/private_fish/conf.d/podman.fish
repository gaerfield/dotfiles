if not type -q podman
  exit 0;
end

set -x DOCKER_HOST "unix://$XDG_RUNTIME_DIR/podman/podman.sock"

abbr --add dco docker compose
