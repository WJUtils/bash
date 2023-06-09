function nvmu() {
  wjutils_info "Ensuring Node version..."
  {
    nvm install >&/dev/null
    nvm use >&/dev/null
  } || {
    nvm install --lts >&/dev/null
    nvm use --lts >&/dev/null
  }
  wjutils_success "Now using: node $(node --version)"
}

nvmu
