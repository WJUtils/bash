#PLUGINSTART
# this section is automatically generated by build_installer.sh
# please do not modify!
files=(
  pnpmaliases.sh
  nodeloader.sh
  nvmloader.sh
  uninstall.sh
  wjutils.plugin.sh
  gitmojialiases.sh
  pnpmloader.sh
  gitaliases.sh
  colors.sh
)
#PLUGINEND

# ### WARINING ###
# This installer is incapable of dealing with nested directories.
# Do not use nested directories in the `./plugin` directory.

# $1 path relative to plugin install dir
# $2 set to prevent mkdir
function resolve_localdir() {
  LOCAL_DIR="$OSH_CUSTOM/plugins/wjutils/$1"
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
  FILE_CONTENTS=$(curl -fsSL "$(resolve_githubdir "$1")")
  if [ $? -ne 0 ]; then
    echo -e "\x1b[31m[WJUtils]\x1b[0m Could not find file at $1"
    exit 1
  fi
  echo "$FILE_CONTENTS"
}

if [ -z "$OSH" ]; then
  echo -e "\x1b[31m[WJUtils]\x1b[0m You must install oh-my-bash first!"
  exit 1
fi

declare -A FILE_CONTENTS_MAP

echo -e "\x1b[36m[WJUtils]\x1b[0m Downloading WJUtils..."
for file in "${files[@]}"; do
  FILE_CONTENTS_MAP[$file]=$(addfile "$file")
done

echo -e "\x1b[36m[WJUtils]\x1b[0m Installing WJUtils..."
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
echo -e "\x1b[36m[WJUtils]\x1b[0m To use this plugin, you must enable it in your .bashrc file:"
echo -e "\t~ ..."
echo -e "\t~ plugins=("
echo -e "\t~ \ttfoo"
echo -e "\t~ \ttbar"
echo -e "\t\x1b[32m+ \twjutils\x1b[0m"
echo -e "\t~ )"
echo -e "\t~ ..."
echo -e "\x1b[36m[WJUtils]\x1b[0m Run \`\x1b[35mwjutilshelp\x1b[0m\` for info on how to configure and use this plugin."
