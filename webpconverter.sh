#!/bin/bash

# converting JPEG images
find /home/bitrix/ext_www/ecnk.ru/local/styles/css/img -type f -and \( -iname "*.jpg" -o -iname "*.jpeg" \) \
-exec bash -c '
webp_path=$(sed 's/\.[^.]*$/.webp/' <<< "$0");
if [ ! -f "$webp_path" ]; then
cwebp -quiet -q 90 "$0" -o "$webp_path";
fi;' {} \;

# converting PNG images
find /home/bitrix/ext_www/ecnk.ru/local/styles/css/img -type f -and -iname "*.png" \
-exec bash -c '
webp_path=$(sed 's/\.[^.]*$/.webp/' <<< "$0");
if [ ! -f "$webp_path" ]; then
cwebp -quiet -lossless "$0" -o "$webp_path";
fi;' {} \;
