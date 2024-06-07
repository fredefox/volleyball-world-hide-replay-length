#!/usr/bin/env bash
set +ex
url=https://static.diceplatform.com/prod/AUTOx350/dce.fivb/settings/VBTV_Portrait_Green_RGB_281_29.5XCTP.png
if [ ! -e icon.png ]
then
  wget $url --output-document icon.png --timestamping
fi
cv() {
  size=$1;
  convert \
    icon.png \
    -background transparent \
    -gravity center \
    -resize ${size}x${size} \
    -extent ${size}x${size} \
    icons/$size.png
}
for size in 16 32 48 128
do
  cv $size
done
