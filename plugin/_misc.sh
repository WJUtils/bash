function copy() {
  local input=$1
  if [[ -z $input ]]; then
    read input
  fi
  echo "$input" | xclip -selection c
}

function mkcode() {
  local directory=$1
  if [[ -z $directory ]]; then
    echo "mkcode: no directory specified: using current directory"
    directory="."
  else
    mkdir -p "$directory"
  fi
  code "$directory"
}

function mischelp() {
  echo -e "Miscellaneous utility commands"
  echo -e "  $(blue "copy")   │ Copy the first arg, or piped content, to the clipboard (requires $(blue "xclip"))"
  echo -e "  $(blue "mkcode") │ Create a directory and open it in VSCode, works as alias for $(blue "code")"
}

__wjutils_helpinfo "Miscellaneous Utilities" "mischelp"
