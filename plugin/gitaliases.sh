#!/bin/bash

__WJUITLS_GITALIASES_DO_GIT_COMPLETE=1
if [ -f /etc/bash_completion.d/git ]; then
  source /etc/bash_completion.d/git
elif [ -f /usr/share/bash-completion/completions/git ]; then
  source /usr/share/bash-completion/completions/git
else
  __WJUITLS_GITALIASES_DO_GIT_COMPLETE=0
fi

alias gt="git"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gt _git
function gtcn() { git clone "git@github.com:$1" "$2"; }
alias gta="git add"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gta _git_add
alias gtc="git commit"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtc _git_commit
alias gtcm="git commit -m"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtcm _git_commit
alias gtpl="git pull"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtpl _git_pull
alias gtps="git push"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtps _git_push
alias gtsh="git stash"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtsh _git_stash
alias gtr="git remote"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtr _git_remote
alias gts="git status"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gts _git_status
alias gtl="git log"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtl _git_log
alias gtb="git branch"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtb _git_branch
alias gtch="git checkout"
[ "$__WJUITLS_GITALIASES_DO_GIT_COMPLETE" = "1" ] && __git_complete gtch _git_checkout

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

__wjutils_helpinfo "Git Shorthands" "gthelp"
