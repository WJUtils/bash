#! bash oh-my-bash.module

WJUTILS="$OSH_CUSTOM/plugins/wjutils"

source "$WJUTILS/colors.sh"
source "$WJUTILS/uninstall.sh"

function wjutils_err() {
  echo -e "$(red "[WJUtils]") $1"
}

function wjutils_warn() {
  echo -e "$(yellow "[WJUtils]") $1"
}

function wjutils_info() {
  echo -e "$(cyan "[WJUtils]") $1"
}

function wjutils_success() {
  echo -e "$(green "[WJUtils]") $1"
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
  echo "| Value      | Description                                                                |"
  echo "| ---------- | -------------------------------------------------------------------------- |"
  echo "| \`color\`    | Effects if command outputs (**not** aliases) will be colored.          |"
  echo "| \`git\`      | Effects whether the Git aliases are enabled.                           |"
  echo "| \`gitmoji\`  | Effects whether the Gitmoji aliases are enabled.                       |"
  echo "| \`nodeload\` | Effect whether the Node Loader will load the Node version.             |"
  echo "| \`nvmload\`  | Effect whether the NVM Loader will update/install NVM.                 |"
  echo "| \`pnpm\`     | Effects whether the PNPM aliases are enabled.                          |"
  echo "| \`pnpmload\` | Effects whether the PNPM Loader will update/install PNPM.              |"
}

# why be smart when a dumb thing works?
WJU_DISABLE=" $WJU_DISABLE "

if [[ $WJU_DISABLE =~ " color " ]]; then
  WJUTILS_COLOR=0
else
  WJUTILS_COLOR=1
fi

if [[ ! $WJU_DISABLE =~ " nvmload " ]]; then
  source "$WJUTILS/nvmloader.sh"
fi

if [[ ! $WJU_DISABLE =~ " nodeload " ]]; then
  source "$WJUTILS/nodeloader.sh"
fi

if [[ ! $WJU_DISABLE =~ " pnpmload " ]]; then
  source "$WJUTILS/pnpmloader.sh"
fi
if [[ ! $WJU_DISABLE =~ " pnpm " ]]; then
  source "$WJUTILS/pnpmaliases.sh"
fi

if [[ ! $WJU_DISABLE =~ " git " ]]; then
  source "$WJUTILS/gitaliases.sh"
fi
if [[ ! $WJU_DISABLE =~ " gitmoji " ]]; then
  source "$WJUTILS/gitmojialiases.sh"
fi
