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
  echo -e "  $(magenta "gt")    $(grey "│") git           $(grey "│") \`$(green "git")\`                                 "
  echo -e "  $(magenta "gtcn")  $(grey "│") git clone     $(grey "│") \`$(green "git clone {git@github.com:\$1} {\$2}")\`"
  echo -e "  $(magenta "gta")   $(grey "│") git add       $(grey "│") \`$(green "git add")\`                             "
  echo -e "  $(magenta "gtc")   $(grey "│") git commit    $(grey "│") \`$(green "git commit")\`                          "
  echo -e "  $(magenta "gtcm")  $(grey "│") git commit -m $(grey "│") \`$(green "git commit -m")\`                       "
  echo -e "  $(magenta "gtpl")  $(grey "│") git pull      $(grey "│") \`$(green "git pull")\`                            "
  echo -e "  $(magenta "gtps")  $(grey "│") git push      $(grey "│") \`$(green "git push")\`                            "
  echo -e "  $(magenta "gtsh")  $(grey "│") git stash     $(grey "│") \`$(green "git stash")\`                           "
  echo -e "  $(magenta "gtr")   $(grey "│") git remote    $(grey "│") \`$(green "git remote")\`                          "
  echo -e "  $(magenta "gts")   $(grey "│") git status    $(grey "│") \`$(green "git status")\`                          "
  echo -e "  $(magenta "gtl")   $(grey "│") git log       $(grey "│") \`$(green "git log")\`                             "
  echo -e "  $(magenta "gtb")   $(grey "│") git branch    $(grey "│") \`$(green "git branch")\`                          "
  echo -e "  $(magenta "gtch")  $(grey "│") git checkout  $(grey "│") \`$(green "git checkout")\`                        "
}

wjutils_helpinfo "Git Shorthands" "gthelp"
