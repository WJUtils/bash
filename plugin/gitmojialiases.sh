alias gtmj="gitmoji"
alias gtmjc="gitmoji -c"

function gtmjhelp() {
  echo -e "Git Shorthands"
  echo -e "  $(blue "gtmj")  │ gitmoji       │ \`$(green "gitmoji")\`                             "
  echo -e "  $(blue "gtmjc") │ gitmoji -c    │ \`$(green "gitmoji -c")\`                          "
}

wjutils_helpinfo "Gitmoji Shorthands" "gtmjhelp"
