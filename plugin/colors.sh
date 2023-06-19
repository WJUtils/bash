function __wjutils_color_check() {
  if [[ "$ARGS" == *"--no-color"* ]]; then
    echo $2
  else
    echo "$1$2\x1b[0m"
  fi
}
function grey() { echo -e $(__wjutils_color_check "\x1b[30m" "$1"); }
function red() { echo -e $(__wjutils_color_check "\x1b[31m" "$1"); }
function green() { echo -e $(__wjutils_color_check "\x1b[32m" "$1"); }
function yellow() { echo -e $(__wjutils_color_check "\x1b[33m" "$1"); }
function blue() { echo -e $(__wjutils_color_check "\x1b[34m" "$1"); }
function magenta() { echo -e $(__wjutils_color_check "\x1b[35m" "$1"); }
function cyan() { echo -e $(__wjutils_color_check "\x1b[36m" "$1"); }
