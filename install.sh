#PLUGINSTART
# this section is automatically generated by build_installer.sh
# please do not modify!
files=(
  json.mjs
  pnpmaliases.sh
  nodeloader.sh
  _misc.sh
  nvmloader.sh
  uninstall.sh
  wjutils.plugin.sh
  gitutils.sh
  gitmojialiases.sh
  pnpmloader.sh
  gitaliases.sh
  colors.sh
)
#PLUGINEND

# ### WARINING ###
# This installer is incapable of dealing with nested directories.
# Do not use nested directories in the `./plugin` directory.

LOCAL_MODE=0
if [ "$1" == "--local" ]; then
  LOCAL_MODE=1
  echo -e "\x1b[36m[WJUtils]\x1b[0m Running in local mode."
else
  echo -e "\x1b[36m[WJUtils]\x1b[0m WJUtils will be installed from the git repository at $(pwd)"
fi

INSTALL_DIR=$(echo "$OSH_CUSTOM" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
if [ -z "$INSTALL_DIR" ]; then
  INSTALL_DIR="$OSH/custom"
fi
INSTALL_DIR="$INSTALL_DIR/plugins/wjutils"

# $1 is the content to echo
function echo_network_only() {
  if [ "$1" == "--local" ]; then
    :
  else
    echo -e "$1"
  fi
}
# $1 path relative to plugin install dir
# $2 set to prevent mkdir
function resolve_localdir() {
  LOCAL_DIR="$INSTALL_DIR/$1"
  if [ -z "$2" ]; then
    mkdir -p "${LOCAL_DIR%/*}"
  fi
  echo "$LOCAL_DIR"
}

# $1 path relative to github tree trunk /plugin
function resolve_githubdir() {
  echo "https://raw.githubusercontent.com/wjutils/bash/trunk/plugin/$1"
}

# $1: see resolve_githubdir
function addfile() {
  if [ $LOCAL_MODE -eq 1 ]; then
    FILE_CONTENTS=$(cat "plugin/$1")
  else
    FILE_CONTENTS=$(curl -fsSL "$(resolve_githubdir "$1")")
  fi
  if [ $? -ne 0 ]; then
    echo -e "\x1b[31m[WJUtils]\x1b[0m Could not find file at $1"
    exit 1
  fi
  echo "$FILE_CONTENTS"
}

if [ -z "$OSH" ]; then
  echo -e "\x1b[31m[WJUtils]\x1b[0m You must install oh-my-bash first!"
  echo -e "\x1b[31m[WJUtils]\x1b[0m See https://github.com/ohmybash/oh-my-bash for installation instructions."
  exit 1
fi

declare -A FILE_CONTENTS_MAP

echo_network_only "\x1b[36m[WJUtils]\x1b[0m Downloading WJUtils..."
for file in "${files[@]}"; do
  FILE_CONTENTS_MAP[$file]=$(addfile "$file")
done

if [ -z "$UPDATE" ]; then
  echo -e "\x1b[36m[WJUtils]\x1b[0m Installing WJUtils..."
else
  echo -e "\x1b[36m[WJUtils]\x1b[0m Updating WJUtils..."
fi
for key in "${!FILE_CONTENTS_MAP[@]}"; do
  echo "${FILE_CONTENTS_MAP[$key]}" >|$(resolve_localdir "$key")
done

echo -e "\x1b[36m[WJUtils]\x1b[0m Purging obsolete files..."
for file in $(find $(resolve_localdir "" 1) -type f); do
  if [ ! -f "$file" ]; then continue; fi
  if [ -z "${FILE_CONTENTS_MAP[${file##*/}]}" ]; then
    rm "$file"
  fi
done

echo -e "\x1b[36m[WJUtils]\x1b[0m WJUtils - Bash successfully installed!"
if [ -z "$UPDATE" ]; then
  echo -e "\x1b[36m[WJUtils]\x1b[0m To use this plugin, you must enable it in your .bashrc file:"
  echo -e "\t~ ..."
  echo -e "\t~ plugins=("
  echo -e "\t~ \tfoo"
  echo -e "\t~ \tbar"
  echo -e "\t\x1b[32m+ \twjutils\x1b[0m"
  echo -e "\t~ )"
  echo -e "\t~ ..."
  echo -e "\x1b[36m[WJUtils]\x1b[0m Run \`\x1b[35mwjutilshelp\x1b[0m\` for info on how to configure and use this plugin."
fi
echo -e "\x1b[36m[WJUtils]\x1b[0m You will need to reload your terminal(s) to load WJUtils."
