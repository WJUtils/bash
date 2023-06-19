function nvmu() {
  __wjutils_info "Ensuring Node version..."
  {
    nvm install >&/dev/null
    nvm use >&/dev/null
  } || {
    nvm install --lts >&/dev/null
    nvm use --lts >&/dev/null
  }
  __wjutils_success "Now using: node $(node --version)"
}

nvmu
