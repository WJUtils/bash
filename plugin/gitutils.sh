source /media/willsterjohnson/NVMe250/\$GITHUB/@WJUTILS/BASH/plugin/colors.sh

# TODO: user configurable types?

function gtbs() {
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo -e "$(red "Not a git repository")"
    return 1
  fi
  local branch_types=("feature" "bugfix" "hotfix" "test" "other")
  local branch_description=(
    "For adding, refactoring or removing a feature"
    "For fixing a bug"
    "For changing code with a temporary solution and/or without following the usual process (usually because of an emergency)"
    "For experimenting outside of an issue/ticket"
    "For anything else"
  )
  echo -e "Select a branch type:"
  for i in $(seq 0 $((${#branch_types[@]} - 1))); do
    echo -e "$(($i + 1))) $(blue "${branch_types[$i]}") - ${branch_description[$i]}"
  done
  read -p "Branch type (enter a number or a name): " branch_type
  if [[ $branch_type =~ ^[0-9]+$ ]]; then
    branch_type=${branch_types[$(($branch_type - 1))]}
  fi
  read -p "Which issue is this related to? (leave blank if none): " issue
  if [[ -z $issue ]]; then
    issue="no-ref"
  else
    issue="issue-$issue"
  fi

  read -p "Enter a short description: " description

  description=$(echo "$description" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr ' ' '-' | tr -cd '[:alnum:]-')

  existing_branches=$(git branch --list | sed 's/* //g' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | tr '\n' ' ')
  IFS=' ' read -r -a existing_branches <<<"$existing_branches"

  for i in $(seq 0 $((${#existing_branches[@]} - 1))); do
    if [[ ${existing_branches[$i]} == "$branch_type/$issue/$description" ]]; then
      echo -e "$(red "Branch already exists")"
      return 1
    fi
  done

  echo -e "Select a base branch:"
  for i in $(seq 0 $((${#existing_branches[@]} - 1))); do
    echo -e "$(($i + 1))) $(blue "${existing_branches[$i]}")"
  done
  read -p "Base branch (enter a number or a name): " base_branch
  if [[ $base_branch =~ ^[0-9]+$ ]]; then
    base_branch=${existing_branches[$(($base_branch - 1))]}
  fi

  git checkout -b "$branch_type/$issue/$description" "$base_branch"

}

function gtuhelp() {
  echo -e "Git utility commands"
  echo -e "\t$(blue "gtbs")\tInteractively create a new branch"
}

wjutils_helpinfo "Git Utilities" "gtuhelp"
