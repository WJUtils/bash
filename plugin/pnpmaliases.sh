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
    echo -e "  $(magenta "pp")    $(grey "│") pnpm                            $(grey "│") \`$(green "pnpm")\`              "
    echo -e "  $(magenta "ppi")   $(grey "│") pnpm install                    $(grey "│") \`$(green "pnpm install")\`      "
    echo -e "  $(magenta "ppup")  $(grey "│") pnpm update                     $(grey "│") \`$(green "pnpm update")\`       "
    echo -e "  $(magenta "ppid")  $(grey "│") pnpm install dev                $(grey "│") \`$(green "pnpm install -D")\`   "
    echo -e "  $(magenta "pps")   $(grey "│") pnpm search                     $(grey "│") \`$(green "pnpm search")\`       "
    echo -e "  $(magenta "ppl")   $(grey "│") pnpm link                       $(grey "│") \`$(green "pnpm link")\`         "
    echo -e "  $(magenta "ppnl")  $(grey "│") pnpm unlink                     $(grey "│") \`$(green "pnpm unlink")\`       "
    echo -e "                       $(cyan "~~~===### MonoRepo ###===~~~")"
    echo -e "  $(magenta "ppr")   $(grey "│") pnpm recursive                  $(grey "│") \`$(green "pnpm -r")\`           "
    echo -e "  $(magenta "ppc")   $(grey "│") pnpm in workspace               $(grey "│") \`$(green "pnpm -C")\`           "
    echo -e "  $(magenta "ppir")  $(grey "│") pnpm install recursive          $(grey "│") \`$(green "pnpm -r install")\`   "
    echo -e "  $(magenta "ppic")  $(grey "│") pnpm install in workspace       $(grey "│") \`$(green "pnpm -C install")\`   "
    echo -e "  $(magenta "ppidc") $(grey "│") pnpm install dev in workspace   $(grey "│") \`$(green "pnpm -C install -D")\`"
    echo -e "  $(magenta "ppiw")  $(grey "│") pnpm install workspace root     $(grey "│") \`$(green "pnpm -W install")\`   "
    echo -e "  $(magenta "ppidw") $(grey "│") pnpm install dev workspace root $(grey "│") \`$(green "pnpm -W install -D")\`"
    echo -e "  $(magenta "ppupr") $(grey "│") pnpm update recursive           $(grey "│") \`$(green "pnpm update -r")\`    "
}

wjutils_helpinfo "PNPM Shorthands" "pphelp"
