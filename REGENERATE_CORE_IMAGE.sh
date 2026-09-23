#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
binary="$root/bin/cocytus"
output="$root/source/cocytus-core.coc"
test -x "$binary"
{
    printf '%s\n' '# Exact native source-image carrier for the shipped Cocytus executable.'
    printf '%s\n' '# This reconstructs bytes; it is not an algorithmically self-hosted compiler.'
    od -An -v -tu1 "$binary" | awk '{for(i=1;i<=NF;i++){print "push "$i" 0"; print "emit"}}'
    printf '%s\n' 'halt'
} > "$output"
printf 'generated=%s\n' "$output"
