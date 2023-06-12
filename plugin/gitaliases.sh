#!/bin/bash

alias gt="git"
function gtcn() { git clone "git@github.com:$1" "$2"; }
alias gta="git add"
alias gtc="git commit"
alias gtcm="git commit -m"
alias gtpl="git pull"
alias gtps="git push"
alias gtsh="git stash"
alias gtr="git remote"
alias gts="git status"
alias gtl="git log"
alias gtb="git branch"
alias gtch="git checkout"

function gthelp() {
  echo -e "Git Shorthands"
  echo -e "  $(blue "gt")   │ git           │ \`$(green "git")\`                                 "
  echo -e "  $(blue "gtcn") │ git clone     │ \`$(green "git clone {git@github.com:\$1} {\$2}")\`"
  echo -e "  $(blue "gta")  │ git add       │ \`$(green "git add")\`                             "
  echo -e "  $(blue "gtc")  │ git commit    │ \`$(green "git commit")\`                          "
  echo -e "  $(blue "gtcm") │ git commit -m │ \`$(green "git commit -m")\`                       "
  echo -e "  $(blue "gtpl") │ git pull      │ \`$(green "git pull")\`                            "
  echo -e "  $(blue "gtps") │ git push      │ \`$(green "git push")\`                            "
  echo -e "  $(blue "gtsh") │ git stash     │ \`$(green "git stash")\`                           "
  echo -e "  $(blue "gtr")  │ git remote    │ \`$(green "git remote")\`                          "
  echo -e "  $(blue "gts")  │ git status    │ \`$(green "git status")\`                          "
  echo -e "  $(blue "gtl")  │ git log       │ \`$(green "git log")\`                             "
  echo -e "  $(blue "gtb")  │ git branch    │ \`$(green "git branch")\`                          "
  echo -e "  $(blue "gtch") │ git checkout  │ \`$(green "git checkout")\`                        "
}

wjutils_helpinfo "Git Shorthands" "gthelp"
