echo "[TEST]: building installer"
bash ./build_installer.sh

echo "[TEST]: running installer"
bash ./install.sh

echo "[TEST]: listing files"

echo "[TEST]: Files now in $DIR:"

DIR="$OSH/custom/plugins/wjutils/"
for file in $(find "$DIR"); do
  if [ "$file" == "$DIR" ]; then continue; fi
  if [ -d "$file" ]; then continue; fi
  echo -e "\t${file#$DIR}"
done
