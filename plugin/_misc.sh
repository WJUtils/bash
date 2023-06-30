function copy() {
  local input=$1
  if [[ -z $input ]]; then
    read input
  fi
  echo "$input" | xclip -selection c
}

function mischelp() {
  echo -e "Miscellaneous utility commands"
  echo -e "  $(blue "copy") │ Copy the first arg, or piped content, to the clipboard (requires $(blue "xclip"))"

}

__wjutils_helpinfo "Miscellaneous Utilities" "mischelp"
