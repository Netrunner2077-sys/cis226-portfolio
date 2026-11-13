#!/bin/bash
# file-check.sh - look before you leap
file="${1:-sales.csv}"
if [[ -f "$file" ]]; then
  echo "Found $file ($(wc -l < "$file") lines)."
else
  echo "Can't find $file." >&2
  exit 1
fi
