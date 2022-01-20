#!/bin/bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euo pipefail
shopt -s nullglob

trap "echo signal;exit 0" SIGINT

log_info() {
  echo -e $(date '+%Y-%m-%d %T')"\e[1;32m $@\e[0m"
}

log_error() {
  echo -e >&2 $(date +"%Y-%m-%d %T")"\e[1;31m $@\e[0m"
}

init_home() {
  rsync -a /init/home-$PUSERNAME/ ~/ 
}

process_init_file() {
	local f="$1"; shift

	case "$f" in
		*.sh)     log_info "$0: running $f"; . "$f" ;;
		*)        echo "$0: ignoring $f" ;;
	esac
	echo "done"
}

log_info "user-i -- $UID "

if [ ! -e ".cache/initialized" ]; then
  log_info "init home"
  init_home
  # create initialized-file pretty early to allow the container to start on second try
  # although one of the users init-script where failing
  mkdir -p ".cache"
  touch ".cache/initialized"

  log_info "executing bootstrapping scripts"
  ls /docker-entrypoint-initdb.d/ > /dev/null
  for f in /docker-entrypoint-initdb.d/*; do
    process_init_file "$f"
  done
fi

echo "executing: '$*'"
if [[ "$*" == "sleep infinity" ]]; then
  sh -c 'trap "exit" TERM; while true; do sleep 1; done'
else
  exec "$@"
fi
