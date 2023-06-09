function ppcp() {
  wjutils_info "Ensuring PNPM version..."
  corepack enable >&/dev/null
  corepack prepare pnpm@latest --activate >&/dev/null
  wjutils_success "Now using: pnpm $(pnpm --version)"
}

ppcp
