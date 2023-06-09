#! bash oh-my-bash.module

WJUTILS="$OSH_CUSTOM/plugins/wjutils"

source "$WJUTILS/colors.sh"
source "$WJUTILS/uninstall.sh"

function wjshHelpInfo() {
  echo -e "$(cyan "[wj.sh]:") Loaded $1 (run \`$(green $2)\` for more info)"
}

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

# why be smart when a dumb thing works?
WJU_DISABLE=" $WJU_DISABLE "

if [[ $WJU_DISABLE =~ " color " ]]; then
  WJUTILS_COLOR=0
else
  WJUTILS_COLOR=1
fi

if [[ ! $WJU_DISABLE =~ " git " ]]; then
  source "$WJUTILS/gitaliases.sh"
fi
if [[ ! $WJU_DISABLE =~ " gitmoji " ]]; then
  source "$WJUTILS/gitmojialiases.sh"
fi
if [[ ! $WJU_DISABLE =~ " nodeload " ]]; then
  source "$WJUTILS/nodeloader.sh"
fi
if [[ ! $WJU_DISABLE =~ " nvmload " ]]; then
  source "$WJUTILS/nvmloader.sh"
fi
if [[ ! $WJU_DISABLE =~ " pnpm " ]]; then
  source "$WJUTILS/pnpmaliases.sh"
fi
if [[ ! $WJU_DISABLE =~ " pnpmload " ]]; then
  source "$WJUTILS/pnpmloader.sh"
fi
