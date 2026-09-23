#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$root"
x11=$(ldconfig -p 2>/dev/null | awk '/libX11\.so\.6 .*x86-64/ {print $NF; exit}')
if [ -z "$x11" ]; then
    printf '%s\n' 'libX11.so.6 was not found' >&2
    exit 1
fi
cc -std=c11 -O2 -Wall -Wextra -Werror bootstrap/cocytus_seed.c -o bin/cocytus "$x11"
for source in apps/*.coc examples/*.coc tests/positive/*.coc; do
    bin/cocytus compile "$source" "${source%.coc}.cob"
done
./SELFHOST.sh
./REGENERATE_CORE_IMAGE.sh
bin/cocytus compile source/cocytus-core.coc source/cocytus-core.cob
printf '%s\n' 'COCYTUS_BUILD_PASS'
