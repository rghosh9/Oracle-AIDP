#!/usr/bin/env bash

set -euo pipefail

DIR="${1:-.}"
echo $DIR
find "$DIR" -type f -name "*.pdb*" | while IFS= read -r file; do
  tmp="${file}.tmp"
  sed -E 's/[[:space:]]{2,}/ /g' "$file" > "$tmp"
  mv "$tmp" "$file"
  echo "Processed: $file"
done
