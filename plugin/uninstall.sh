function wjutilsremove() {
  PLUGIN_DIR="$OSH/custom/plugins/wjutils/"

  if [ -d "$PLUGIN_DIR" ]; then
    read -p $'\x1b[33m[WJUtils]\x1b[0m This will uninstall WJUtils. Are you sure? [y/n] ' RESPONSE

    if [ "$RESPONSE" == "y" ] || [ "$RESPONSE" == "Y" ]; then

      wjutils_info "Uninstalling WJUtils..."

      rm -rf "$PLUGIN_DIR"
      wjutils_success "WJUtils successfully removed!"
      wjutils_info "If this was a mistake, the following command should restore your installation:"
      wjutils_info "\tbash -c \"\$(curl -fsSL \"https://raw.githubusercontent.com/wjutils/bash/trunk/install.sh\")\""
      wjutils_info "Make sure to remove WJUtils from your plugins list in your .bashrc file:"
      wjutils_info "\t~ ..."
      wjutils_info "\t~ plugins=("
      wjutils_info "\t~ \tfoo"
      wjutils_info "\t~ \tbar"
      wjutils_info "\t$(red "- \twjutils")"
      wjutils_info "\t~ )"
      wjutils_info "\t~ ..."
      wjutils_info "You should also remove the WJU_DISABLE variable from your .bashrc file if you set it."
      wjutils_info "You will need to reload your terminal(s) to unload WJUtils."
    else
      wjutils_info "Okay, will not uninstall."
    fi
  else
    wjutils_err "Could not find WJUtils installation. Has it been moved?"
    SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
    wjutils_err "This uninstall script is currently located at:"
    wjutils_err "\t$SCRIPT_DIR"
    wjutils_err "\t(expected: $PLUGIN_DIR)"
  fi
}
