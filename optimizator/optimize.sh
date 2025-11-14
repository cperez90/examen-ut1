#!/bin/bash

# Call with optimize.sh 100 200 90 -> 100 width, 200 height, 90% quality
WIDTH=$1
HEIGHT=$2
QUALITY=$3

ORIGINAL_DIR="/app/media/original"
OUTPUT_DIR="/app/media/optimized${WIDTH}x${HEIGHT}_${QUALITY}"

# Create output directory if it doesn't exist
rm -fr "$OUTPUT_DIR"
cp "$ORIGINAL_DIR" "$OUTPUT_DIR" -r

# BEFORE USE
# apt install -y ffmpeg
# apt install -y imagemagick

FILES=$(find $OUTPUT_DIR -type f -follow)
for f in $FILES
do
  # Avoid .DS_Store files and mp4 files
  if [[ $(basename $f) == .DS_Store || $f == *.mp4 ]]; then
    continue
  fi

  echo "Processing $f file..."
  # take action on each file. $f store current file name
  # convert $f -resize 100x100 $f
  if [[ $f == *.jpg ]]; then
    mogrify -quality $QUALITY -resize $1x$2 -write $OUTPUT_DIR/$(basename $f) $f
  fi

  if [[ $f == *.jpeg ]]; then
      mogrify -quality $QUALITY -resize $1x$2 -write $OUTPUT_DIR/$(basename $f) $f
  fi

  if [[ $f == *.png ]]; then
    mogrify -quality $QUALITY -resize $1x$2 -write $OUTPUT_DIR/$(basename $f) $f
  fi

  # Create webp images
  filename=$(basename $f)
  filenameWithoutExtension="${filename%.*}"

  # Reduce webp image size
  mogrify -format webp -quality $QUALITY -resize $1x$2 -write $OUTPUT_DIR/${filenameWithoutExtension}.webp $f
done