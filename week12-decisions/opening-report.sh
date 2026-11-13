#!/bin/bash
set -euo pipefail
# opening-report.sh - Sea Glass and Silence morning report
# Usage: ./opening-report.sh [sales-file]
# Author: Aldrich

sales_file="${1:-sales.csv}"
if [[ ! -f "$sales_file" ]]; then
  echo "Error: I can't find the file '$sales_file'." >&2
  exit 1
elif [[ $(wc -l < "$sales_file") -lt 2 ]]; then
  echo "Error: '$sales_file' has no sales in it." >&2
  exit 2
fi
read -r -p "Who is opening the shop? " opener
sales=$(awk -F, 'NR>1' "$sales_file" | wc -l)
books=$(awk -F, 'NR>1 {b+=$3} END {print b}' "$sales_file")
revenue=$(awk -F, 'NR>1 {t+=$3*$4} END {printf "%.2f", t}' "$sales_file")
online=$(awk -F, 'NR>1 && $5 == "online" {t+=$3*$4} END {printf "%.2f", t}' "$sales_file")

if [[ $books -ge 20 ]]; then
  mood="Busy week"
elif [[ $books -ge 10 ]]; then
  mood="Steady week"
else
  mood="Quiet week"
fi
echo "=== Sea Glass and Silence: Morning Report ==="
echo "Good morning, $opener. Today is $(date +%A)."
echo "Reading: $sales_file"
echo "Sales: $sales"
echo "Books: $books"
echo "Revenue: \$${revenue}"
echo "Online Revenue: \$${online}"
echo "Mood: $mood"
