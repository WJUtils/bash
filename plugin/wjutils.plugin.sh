#! bash oh-my-bash.module

INSTALL_DIR=$(echo "$OSH_CUSTOM" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
if [ -z "$INSTALL_DIR" ]; then
  INSTALL_DIR="$OSH/custom"
fi
INSTALL_DIR="$INSTALL_DIR/plugins/wjutils"

source "$INSTALL_DIR/colors.sh"
source "$INSTALL_DIR/uninstall.sh"

function wjutils_err() {
  echo -e "$(red "(✘)[WJUtils]") $1"
}

function wjutils_warn() {
  echo -e "$(yellow "(!)[WJUtils]") $1"
}

function wjutils_info() {
  echo -e "$(cyan "(i)[WJUtils]") $1"
}

function wjutils_success() {
  echo -e "$(green "(✔)[WJUtils]") $1"
}

function wjutils_helpinfo() {
  wjutils_info "Loaded $1 (run \`$(green $2)\` for more info)"
}

function wjutilshelp() {
  echo "WJU bash is configured by a single environment variable; \`WJU_DISABLE\`."
  echo ""
  echo "As this is primarily for web developers, you can imagine this variable working like a class in HTML."
  echo ""
  echo "Examples:"
  echo ""
  echo "\`\`\`bash"
  echo "# disable the NVM Loader's update/install, all git/gitmoji aliases, surpress colored outputs"
  echo "WJU_DISABLE=\"nvminstall git color\""
  echo "# disable all NVM Loader functionality, gitmoji aliases, and pnpm aliases"
  echo "WJU_DISABLE=\"nvm gitmoji pnpm\""
  echo "\`\`\`"
  echo ""
  echo "The recognised values are:"
  echo ""
  echo "$(cyan "│") Value    $(cyan "│") Description                                                   $(cyan "│")"
  echo "$(cyan "├──────────┼───────────────────────────────────────────────────────────────┤")"
  echo "$(cyan "│") $(magenta "color")    $(cyan "│") Effects if command outputs (**not** aliases) will be colored. $(cyan "│")"
  echo "$(cyan "│") $(magenta "git")      $(cyan "│") Effects whether the Git aliases are enabled.                  $(cyan "│")"
  echo "$(cyan "│") $(magenta "gitmoji")  $(cyan "│") Effects whether the Gitmoji aliases are enabled.              $(cyan "│")"
  echo "$(cyan "│") $(magenta "nodeload") $(cyan "│") Effect whether the Node Loader will load the Node version.    $(cyan "│")"
  echo "$(cyan "│") $(magenta "nvmload")  $(cyan "│") Effect whether the NVM Loader will update/install NVM.        $(cyan "│")"
  echo "$(cyan "│") $(magenta "pnpm")     $(cyan "│") Effects whether the PNPM aliases are enabled.                 $(cyan "│")"
  echo "$(cyan "│") $(magenta "pnpmload") $(cyan "│") Effects whether the PNPM Loader will update/install PNPM.     $(cyan "│")"
}

# why be smart when a dumb thing works?
WJU_DISABLE=" $WJU_DISABLE "

if [[ $WJU_DISABLE =~ " color " ]]; then
  WJUTILS_COLOR=0
else
  WJUTILS_COLOR=1
fi

if [[ ! $WJU_DISABLE =~ " nvmload " ]]; then
  source "$INSTALL_DIR/nvmloader.sh"
fi

if [[ ! $WJU_DISABLE =~ " nodeload " ]]; then
  source "$INSTALL_DIR/nodeloader.sh"
fi

if [[ ! $WJU_DISABLE =~ " pnpmload " ]]; then
  source "$INSTALL_DIR/pnpmloader.sh"
fi
if [[ ! $WJU_DISABLE =~ " pnpm " ]]; then
  source "$INSTALL_DIR/pnpmaliases.sh"
fi

if [[ ! $WJU_DISABLE =~ " git " ]]; then
  source "$INSTALL_DIR/gitaliases.sh"
fi
if [[ ! $WJU_DISABLE =~ " gitmoji " ]]; then
  source "$INSTALL_DIR/gitmojialiases.sh"
fi

wjutils_info "Until an auto-update script is added, check https://github.com/WJUtils/bash for updates."
wjutilshelp
