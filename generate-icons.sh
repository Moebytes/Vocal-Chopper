#!/bin/bash

SOURCE_PNG="assets/icon.png"
ICONSET_DIR="assets/icon.iconset"
ICNS_OUTPUT="assets/icon.icns"
ICO_OUTPUT="assets/icon.ico"

echo "Generating icons from ${SOURCE_PNG}..."

rm -rf "$ICONSET_DIR"
mkdir "$ICONSET_DIR"

sips -z 16 16     "$SOURCE_PNG" --out "$ICONSET_DIR/icon_16x16.png" > /dev/null
sips -z 32 32     "$SOURCE_PNG" --out "$ICONSET_DIR/icon_16x16@2x.png" > /dev/null
sips -z 32 32     "$SOURCE_PNG" --out "$ICONSET_DIR/icon_32x32.png" > /dev/null
sips -z 64 64     "$SOURCE_PNG" --out "$ICONSET_DIR/icon_32x32@2x.png" > /dev/null
sips -z 128 128   "$SOURCE_PNG" --out "$ICONSET_DIR/icon_128x128.png" > /dev/null
sips -z 256 256   "$SOURCE_PNG" --out "$ICONSET_DIR/icon_128x128@2x.png" > /dev/null
sips -z 256 256   "$SOURCE_PNG" --out "$ICONSET_DIR/icon_256x256.png" > /dev/null
sips -z 512 512   "$SOURCE_PNG" --out "$ICONSET_DIR/icon_256x256@2x.png" > /dev/null
sips -z 512 512   "$SOURCE_PNG" --out "$ICONSET_DIR/icon_512x512.png" > /dev/null
cp "$SOURCE_PNG"  "$ICONSET_DIR/icon_512x512@2x.png"

iconutil -c icns "$ICONSET_DIR" -o "$ICNS_OUTPUT"

rm -rf "$ICONSET_DIR"

echo "Created ${ICNS_OUTPUT}"

magick "$SOURCE_PNG" \
  -define icon:auto-resize=256,128,64,48,32,16 \
  "$ICO_OUTPUT"

echo "Created ${ICO_OUTPUT}"