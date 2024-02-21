#!/usr/bin/env sh

#set -euxo pipefail

set_or_update(){
  target_file="/etc/security/pam_env.conf"
  environment_variable="$1"
  default_value="$2"
  grep --quiet "^$environment_variable" $target_file \
      && sudo sed --in-place "s#^$environment_variable.*#$environment_variable $default_value#" $target_file \
      || echo "$environment_variable $default_value" | sudo tee -a $target_file > /dev/null
  export $environment_variable=$default_value
}

set_or_update 'XDG_CACHE_HOME'  'DEFAULT=@{HOME}/.cache'
set_or_update 'XDG_CONFIG_HOME' 'DEFAULT=@{HOME}/.config'
set_or_update 'XDG_LOCAL_HOME'  'DEFAULT=@{HOME}/.local'
set_or_update 'XDG_PREFIX_HOME' 'DEFAULT=${XDG_LOCAL_HOME}'
set_or_update 'XDG_DATA_HOME'   'DEFAULT=${XDG_LOCAL_HOME}/share'
set_or_update 'XDG_STATE_HOME'  'DEFAULT=${XDG_LOCAL_HOME}/state'
set_or_update 'XDG_BIN_HOME'    'DEFAULT=${XDG_LOCAL_HOME}/bin'