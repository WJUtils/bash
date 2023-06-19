# $1 `1` for silent, `0` for verbose. default is `0`
function nvmu() {
  # print "test"
  [ "$1" != "1" ] && __wjutils_info "Ensuring Node version..."
  {
    nvm install >&/dev/null
    nvm use >&/dev/null
  } || {
    if [ ! -f "./package.json" ]; then
      $(exit 1)
    elif [ "$(cat "./package.json" | grep -E "^[[:space:]]*\"engines\"[[:space:]]*:[[:space:]]*{" | grep -E "^[[:space:]]*\"node\"[[:space:]]*:" | wc -l)" = "0" ]; then
      $(exit 1)
    elif [ "$(cat "./package.json" | grep -E "^[[:space:]]*\"node\"[[:space:]]*:" | wc -l)" = "0" ]; then
      $(exit 1)
    fi
    if ! command -v node &>/dev/null; then
      __wjutils_err "Node is not installed but a \`package.json\` file was found with a potential Node engine version."
      __wjutils_info "Installing LTS to parse JSON..."
      nvm install --lts >&/dev/null
      nvm use --lts >&/dev/null
    fi
    local version="$(__wjutils_json_read "localpackagejson" "engines.node")"
    if [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || [[ "$version" =~ ^~[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      version="$(echo "$version" | sed "s/^~//g")"
    elif [[ "$version" =~ ^.*\<[0-9]+$ ]]; then
      version="$(echo "$version" | sed "s/^.*\<//g" | awk '{print $1-1}')"
    else
      $(exit 1)
    fi
    nvm install "$version" >&/dev/null
    nvm use "$version" >&/dev/null
  } || {
    nvm install --lts >&/dev/null
    nvm use --lts >&/dev/null
  }
  [ "$1" != "1" ] && __wjutils_success "Now using: node $(green "$(node --version)").\tTo re-ensure Node version, run \`$(blue "nvmu")\` again."
}

nvmu
