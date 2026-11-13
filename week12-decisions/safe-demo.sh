#!/bin/bash
set -e
# safe-demo.sh - what the safety switches do
echo "Step 1: copy the sales file"
cp no-such-file.csv /tmp/copy.csv
echo "Step 2: delete the original (pretend)"
