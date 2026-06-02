#!/bin/sh

set -eu

if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required: writefile and writestr"
    exit 1
fi

writefile="$1"
writestr="$2"

writedir=$(dirname "$writefile")

if ! mkdir -p "$writedir"; then
    echo "Error: Could not create directory path '$writedir'"
    exit 1
fi

if ! printf '%s\n' "$writestr" > "$writefile"; then
    echo "Error: Could not create file '$writefile'"
    exit 1
fi
