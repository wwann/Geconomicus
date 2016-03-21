#!/bin/bash

DPI=300
SHADOW_OFFSET=10

# convert SVG to PNG with inkscape
for file in build/html/_static/money/*.svg
do
    # inkscape convert svg to png
    inkscape -d ${DPI} -z -f "${file}" -e "${file%.svg}.png"

    # image magick create preview with drop shadow
    convert "${file%.svg}.png" -background black \( +clone -shadow 60x${SHADOW_OFFSET}+${SHADOW_OFFSET}+${SHADOW_OFFSET} \) +swap \
          -compose Over -composite +repage  "${file%.svg}_preview.png"
done
