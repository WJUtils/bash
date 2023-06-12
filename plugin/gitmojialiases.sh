alias gtmj="gitmoji"
alias gtmjc="gitmoji -c"

function gtmjhelp() {
  echo -e "Git Shorthands"
  echo -e "  $(blue "gtmj")  $(grey "|") gitmoji       $(grey "|") \`$(green "gitmoji")\`                             "
  echo -e "  $(blue "gtmjc") $(grey "|") gitmoji -c    $(grey "|") \`$(green "gitmoji -c")\`                          "
}

wjutils_helpinfo "Gitmoji Shorthands" "gtmjhelp"
