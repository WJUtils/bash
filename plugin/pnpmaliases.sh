#!/bin/bash

# general
alias pp="pnpm"
alias ppi="pnpm install"
alias ppup="pnpm update"
alias ppid="pnpm install -D"
alias pps="pnpm search"
alias ppl="pnpm link"
alias ppnl="pnpm unlink"
# monorepo
alias ppr="pnpm -r"
alias ppc="pnpm -C"
alias ppir="pnpm -r install"
alias ppic="pnpm install -C"
alias ppidc="pnpm install -D -C"
alias ppiw="pnpm install -w"
alias ppidw="pnpm install -D -w"
alias ppupr="pnpm update -r"

function pphelp() {
    echo -e "PNPM Shorthands"
    echo -e "                       $(cyan "~~~===### General ###===~~~")"
    echo -e "  $(blue "pp")    │ pnpm                            │ \`$(green "pnpm")\`              "
    echo -e "  $(blue "ppi")   │ pnpm install                    │ \`$(green "pnpm install")\`      "
    echo -e "  $(blue "ppup")  │ pnpm update                     │ \`$(green "pnpm update")\`       "
    echo -e "  $(blue "ppid")  │ pnpm install dev                │ \`$(green "pnpm install -D")\`   "
    echo -e "  $(blue "pps")   │ pnpm search                     │ \`$(green "pnpm search")\`       "
    echo -e "  $(blue "ppl")   │ pnpm link                       │ \`$(green "pnpm link")\`         "
    echo -e "  $(blue "ppnl")  │ pnpm unlink                     │ \`$(green "pnpm unlink")\`       "
    echo -e "                       $(cyan "~~~===### MonoRepo ###===~~~")"
    echo -e "  $(blue "ppr")   │ pnpm recursive                  │ \`$(green "pnpm -r")\`           "
    echo -e "  $(blue "ppc")   │ pnpm in workspace               │ \`$(green "pnpm -C")\`           "
    echo -e "  $(blue "ppir")  │ pnpm install recursive          │ \`$(green "pnpm -r install")\`   "
    echo -e "  $(blue "ppic")  │ pnpm install in workspace       │ \`$(green "pnpm -C install")\`   "
    echo -e "  $(blue "ppidc") │ pnpm install dev in workspace   │ \`$(green "pnpm -C install -D")\`"
    echo -e "  $(blue "ppiw")  │ pnpm install workspace root     │ \`$(green "pnpm -W install")\`   "
    echo -e "  $(blue "ppidw") │ pnpm install dev workspace root │ \`$(green "pnpm -W install -D")\`"
    echo -e "  $(blue "ppupr") │ pnpm update recursive           │ \`$(green "pnpm update -r")\`    "
}

__wjutils_helpinfo "PNPM Shorthands" "pphelp"
