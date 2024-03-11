# aqua env-variables
if test -f $XDG_DATA_HOME/aquaproj-aqua/bin/aqua
  set -x AQUA_CONFIG "$XDG_CONFIG_HOME/aquaproj-aqua/aqua.yaml"
  set -x AQUA_ROOT_DIR "$XDG_DATA_HOME/aquaproj-aqua"
  set -x PATH "$AQUA_ROOT_DIR/bin" $PATH
  #if status is-interactive
  # howto aqua completions? 
  #end
end