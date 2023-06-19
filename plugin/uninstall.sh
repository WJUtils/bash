function wjutilsremove() {
  PLUGIN_DIR="$OSH/custom/plugins/wjutils/"

  if [ -d "$PLUGIN_DIR" ]; then
    read -p $'\x1b[33m[WJUtils]\x1b[0m This will uninstall WJUtils. Are you sure? [y/n] ' RESPONSE

    if [ "$RESPONSE" == "y" ] || [ "$RESPONSE" == "Y" ]; then

      __wjutils_info "Uninstalling WJUtils..."

      rm -rf "$PLUGIN_DIR"
      __wjutils_success "WJUtils successfully removed!"
      __wjutils_info "If this was a mistake, the following command should restore your installation:"
      __wjutils_info "\tbash -c \"\$(curl -fsSL \"https://raw.githubusercontent.com/wjutils/bash/trunk/install.sh\")\""
      __wjutils_info "Make sure to remove WJUtils from your plugins list in your .bashrc file:"
      __wjutils_info "\t~ ..."
      __wjutils_info "\t~ plugins=("
      __wjutils_info "\t~ \tfoo"
      __wjutils_info "\t~ \tbar"
      __wjutils_info "\t$(red "- \twjutils")"
      __wjutils_info "\t~ )"
      __wjutils_info "\t~ ..."
      __wjutils_info "You should also remove the WJU_DISABLE variable from your .bashrc file if you set it."
      __wjutils_info "You will need to reload your terminal(s) to unload WJUtils."
    else
      __wjutils_info "Okay, will not uninstall."
    fi
  else
    __wjutils_err "Could not find WJUtils installation. Has it been moved?"
    SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
    __wjutils_err "This uninstall script is currently located at:"
    __wjutils_err "\t$SCRIPT_DIR"
    __wjutils_err "\t(expected: $PLUGIN_DIR)"
  fi
}

function wjutilsupdate() {
  UPDATE=1 bash -c "$(curl -fsSL "https://raw.githubusercontent.com/wjutils/bash/trunk/install.sh")"
}
