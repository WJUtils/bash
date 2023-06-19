function ppcp() {
  __wjutils_info "Ensuring PNPM version..."
  corepack enable >&/dev/null
  corepack prepare pnpm@latest --activate >&/dev/null
  __wjutils_success "Now using: pnpm $(green "$(pnpm --version)").\tTo re-ensure PNPM version, run \`$(blue "ppcp")\` again."
}

ppcp
