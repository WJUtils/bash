#! bash oh-my-bash.module

export __WJUTILS_INSTALL_DIR=$(echo "$OSH_CUSTOM" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
if [ -z "$__WJUTILS_INSTALL_DIR" ]; then
  __WJUTILS_INSTALL_DIR="$OSH/custom"
fi
__WJUTILS_INSTALL_DIR="$__WJUTILS_INSTALL_DIR/plugins/wjutils"

source "$__WJUTILS_INSTALL_DIR/colors.sh"
source "$__WJUTILS_INSTALL_DIR/uninstall.sh"

function __wjutils_err() {
  echo -e "$(red "(✘)[WJUtils]") $1"
}

function __wjutils_warn() {
  echo -e "$(yellow "(!)[WJUtils]") $1"
}

function __wjutils_info() {
  echo -e "$(cyan "(i)[WJUtils]") $1"
}

function __wjutils_success() {
  echo -e "$(green "(✔)[WJUtils]") $1"
}

function __wjutils_helpinfo() {
  __wjutils_info "Loaded $1\t(run \`$(blue $2)\` for more info)"
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
  echo "│ Value    │ Description                                                   │"
  echo "├──────────┼───────────────────────────────────────────────────────────────┤"
  echo "│ $(blue "color")    │ Effects if command outputs (**not** aliases) will be colored. │"
  echo "│ $(blue "git")      │ Effects whether the Git aliases are enabled.                  │"
  echo "│ $(blue "gitutils") │ Effects whether the Git utility commands are enabled.         │"
  echo "│ $(blue "gitmoji")  │ Effects whether the Gitmoji aliases are enabled.              │"
  echo "│ $(blue "nodeload") │ Effect whether the Node Loader will load the Node version.    │"
  echo "│ $(blue "nvmload")  │ Effect whether the NVM Loader will update/install NVM.        │"
  echo "│ $(blue "pnpm")     │ Effects whether the PNPM aliases are enabled.                 │"
  echo "│ $(blue "pnpmload") │ Effects whether the PNPM Loader will update/install PNPM.     │"
}

# $1 is the subcommand
# $2 is the keychain
# $3 is the filepath (optional)
function __wjutils_json_read() {
  echo "$(node "$__WJUTILS_INSTALL_DIR/json.mjs" "read" "$1" "$2" "$3" 2>/dev/null)"
}

# $1 is the subcommand
# $2 is the keychain
# $3 is the filepath (optional)
function __wjutils_json_readliteral() {
  echo "$(node "$__WJUTILS_INSTALL_DIR/json.mjs" "readliteral" "$1" "$2" "$3" 2>/dev/null)"
}

# $1 is the subcommand
# $2 is the keychain
# $3 is the value
# $4 is the filepath (optional)
function __wjutils_json_write() {
  echo "$(node "$__WJUTILS_INSTALL_DIR/json.mjs" "write" "$1" "$2" "$3" "$4" 2>/dev/null)"
}

# why be smart when a dumb thing works?
WJU_DISABLE=" $WJU_DISABLE "

if [[ $WJU_DISABLE =~ " color " ]]; then
  WJUTILS_COLOR=0
else
  WJUTILS_COLOR=1
fi

if [[ ! $WJU_DISABLE =~ " nvmload " ]]; then
  source "$__WJUTILS_INSTALL_DIR/nvmloader.sh"
fi

if [[ ! $WJU_DISABLE =~ " nodeload " ]]; then
  source "$__WJUTILS_INSTALL_DIR/nodeloader.sh"
fi

if [[ ! $WJU_DISABLE =~ " pnpmload " ]]; then
  source "$__WJUTILS_INSTALL_DIR/pnpmloader.sh"
fi
if [[ ! $WJU_DISABLE =~ " pnpm " ]]; then
  source "$__WJUTILS_INSTALL_DIR/pnpmaliases.sh"
fi

if [[ ! $WJU_DISABLE =~ " git " ]]; then
  source "$__WJUTILS_INSTALL_DIR/gitaliases.sh"
fi
if [[ ! $WJU_DISABLE =~ " gitmoji " ]]; then
  source "$__WJUTILS_INSTALL_DIR/gitmojialiases.sh"
fi
if [[ ! $WJU_DISABLE =~ " gitutils " ]]; then
  source "$__WJUTILS_INSTALL_DIR/gitutils.sh"
fi

if [[ ! $WJU_DISABLE =~ " misc " ]]; then
  source "$__WJUTILS_INSTALL_DIR/_misc.sh"
fi

__wjutils_info "Until an auto-update script is added, check https://github.com/WJUtils/bash for updates."
