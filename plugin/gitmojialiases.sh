alias gtmj="gitmoji"
alias gtmjc="gitmoji -c"

function gtmjhelp() {
  echo -e "Git Shorthands"
  echo -e "  $(magenta "gtmj")  $(grey "|") gitmoji       $(grey "|") \`$(green "gitmoji")\`                             "
  echo -e "  $(magenta "gtmjc") $(grey "|") gitmoji -c    $(grey "|") \`$(green "gitmoji -c")\`                          "
}

wjshHelpInfo "Gitmoji Shorthands" "gtmjhelp"
