function nvmi() {
  wjutils_info "Updating NVM..."
  NVM_VERSION_TAG=$(curl -fsSL --head "https://github.com/nvm-sh/nvm/releases/latest" | grep -i location | sed 's/.*\///' | sed 's/.$//')

  DO_INSTALL=0
  if ! command -v nvm >/dev/null 2>&1; then
    wjutils_warn "NVM not installed."
    DO_INSTALL=1
  elif [ "v$(nvm --version)" != "$NVM_VERSION_TAG" ]; then
    wjutils_warn "NVM is out of date. (v$(nvm --version) vs $NVM_VERSION_TAG)"
    DO_INSTALL=1
  elif [ "$1" == "-f" ]; then
    wjutils_warn "Forcing NVM update."
    DO_INSTALL=1
  fi

  if [ $DO_INSTALL -eq 1 ]; then
    wjutils_info "Downloading latest NVM..."
    bash -c "$(curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION_TAG/install.sh")" >/dev/null 2>&1
    nvmsetup
    wjutils_success "Now using: nvm v$(nvm --version)"
  else
    wjutils_success "NVM is up to date (v$(nvm --version)). To force an update, use \`nvmi -f\`."
  fi

}

function nvmsetup() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

nvmsetup
nvmi
