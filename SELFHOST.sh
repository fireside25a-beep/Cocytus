#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$root"
work=$(mktemp -d)
trap 'find "$work" -type f -delete 2>/dev/null || :; rmdir "$work" 2>/dev/null || :' EXIT HUP INT TERM

bin/cocytus compile source/compiler-readable.coc "$work/readable.cob"
bin/cocytus canonicalize "$work/readable.cob" source/compiler-self.coc
bin/cocytus compile source/compiler-self.coc "$work/stage1.cob"
cmp "$work/readable.cob" "$work/stage1.cob"

bin/cocytus run "$work/stage1.cob" < source/compiler-self.coc > "$work/stage2.cob" 2> "$work/stage2.status"
cmp "$work/stage1.cob" "$work/stage2.cob"
bin/cocytus run "$work/stage2.cob" < source/compiler-self.coc > "$work/stage3.cob" 2> "$work/stage3.status"
cmp "$work/stage2.cob" "$work/stage3.cob"

cp "$work/stage1.cob" bin/cocytus-compiler.cob
printf 'compiler_sha256=%s\n' "$(sha256sum "$work/stage1.cob" | awk '{print $1}')"
printf '%s\n' 'COCYTUS_SELFHOST_OK'
