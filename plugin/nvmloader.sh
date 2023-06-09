function nvmi() {
  wjutils_info "Updating NVM..."
  NVM_VERSION_TAG=$(curl -fsSL --head "https://github.com/nvm-sh/nvm/releases/latest" | grep -i location | sed 's/.*\///' | sed 's/.$//')

  DO_INSTALL=0
  if ! command -v nvm >/dev/null 2>&1; then
    DO_INSTALL=1
  elif [ "v$(nvm --version)" != "$NVM_VERSION_TAG" ]; then
    DO_INSTALL=1
  elif [ "$1" == "-f" ]; then
    DO_INSTALL=1
  fi

  if [ $DO_INSTALL -eq 1 ]; then
    bash -c "$(curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION_TAG/install.sh")" >/dev/null 2>&1
    nvmsetup
    wjutils_success "Now using: nvm v$(nvm --version)"
  else
    wjutils_success "NVM is up to date. (v$(nvm --version))"
    wjutils_info "To force an update, use \`-f\`."
  fi

}

function nvmsetup() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

if ! command -v nvm >/dev/null 2>&1; then
  nvmi
else
  nvmsetup
fi
