#!/bin/bash

alias gt="git"
function gtcn() { git clone "git@github.com:$1" "$2"; }
alias gta="git add"
__git_complete gta _git_add
alias gtc="git commit"
__git_complete gtc _git_commit
alias gtcm="git commit -m"
__git_complete gtcm _git_commit
alias gtpl="git pull"
__git_complete gtpl _git_pull
alias gtps="git push"
__git_complete gtps _git_push
alias gtsh="git stash"
__git_complete gtsh _git_stash
alias gtr="git remote"
__git_complete gtr _git_remote
alias gts="git status"
__git_complete gts _git_status
alias gtl="git log"
__git_complete gtl _git_log
alias gtb="git branch"
__git_complete gtb _git_branch
alias gtch="git checkout"
__git_complete gtch _git_checkout

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
