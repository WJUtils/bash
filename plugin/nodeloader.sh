function __nvmu_lts() {
  nvm install --lts >&/dev/null
  nvm use --lts >&/dev/null
}

# $1 `1` for silent, `0` for verbose. default is `0`
function nvmu() {
  # print "test"
  [ "$1" != "1" ] && __wjutils_info "Ensuring Node version..."

  HAS_NVMRC=$(cat ./.nvmrc 2>/dev/null)
  HAS_PACKAGEJSON=$(cat ./package.json 2>/dev/null)

  if [ "$HAS_NVMRC" != "" ]; then
    nvm install "$version" >&/dev/null
  elif [ "$HAS_PACKAGEJSON" != "" ]; then
    local version="$(__wjutils_json_read "localpackagejson" "engines.node")"
    if [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || [[ "$version" =~ ^~[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      version="$(echo "$version" | sed "s/^~//g")"
    elif [[ "$version" =~ ^.*\<[0-9]+$ ]]; then
      version="$(echo "$version" | sed "s/^.*\<//g" | awk '{print $1-1}')"
    else
      nvm install --lts >&/dev/null
    fi
    if [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      nvm install "$version" >&/dev/null
    fi
  else
    nvm install --lts >&/dev/null
  fi

  [ "$1" != "1" ] && __wjutils_success "Now using: node $(green "$(node --version)").\tTo re-ensure Node version, run \`$(blue "nvmu")\` again."
}

nvmu
