# Cocytus language reference

Source is UTF-8 text with one instruction per line. Empty lines and lines whose
first non-space character is `#` are ignored. Integers use decimal notation.
Names contain letters, digits after the first character, or underscore and are
limited to 31 bytes.

## Exact values

`push N E` creates the exact finite dyadic `N / 2^E`, where `0 <= E <= 62`.
Normalization removes powers of two from `N`. Arithmetic is checked: values
that cannot be represented become a deterministic runtime error rather than a
rounded number.

| Form | Effect |
|---|---|
| `push N E` | Push normalized `N / 2^E` |
| `add`, `sub`, `mul`, `neg` | Exact checked arithmetic |
| `eq`, `lt`, `gt` | Pop two values and push exact integer 0 or 1 |
| `dup`, `drop`, `swap` | Stack transforms |
| `print` | Print the top value without popping it |
| `emit` | Pop and write an exact integer byte |

## Control and storage

| Form | Effect |
|---|---|
| `label name` | Branch target |
| `jump name`, `jz name`, `jnz name` | Unconditional or stack-conditioned branch |
| `ptolomaea name` | Function entry and call target |
| `call name`, `return` | Bounded call and return |
| `var name N E` | Declare and initialize one exact variable |
| `load name`, `store name` | Variable access |
| `judecca A N` | Declare byte-memory address A with exactly N permitted accesses |
| `mload`, `mstore` | Stack-addressed byte memory under the Judecca contract |
| `antenora` | Read and reversibly warp one byte; push `-1` at EOF |
| `sourcebyte` | Read one unwarped source byte; used by native compiler code; push `-1` at EOF |
| `halt` | Stop successfully |

## Canonical compiler form

The self-hosted compiler consumes a deliberately exact form of Cocytus source:

```text
image COUNT
native OP EXPONENT A B C D K
```

`image` declares the exact instruction count. Each `native` line describes one
COC1 instruction. Fields are signed decimal integers; the opcode and exponent
occupy one byte each, while `A` through `K` occupy signed 64-bit fields. The C
seed validates the declared count, and the Cocytus compiler fails on truncation
or surplus numeric records. Canonical form is not generated C or assembly; it
is the fixed-point representation of Cocytus bytecode in Cocytus source.

## Graphics

| Form | Effect |
|---|---|
| `clear COLOR` | Fill the 640×400 canvas |
| `pixel X Y COLOR` | Draw one clipped pixel |
| `rect X Y W H COLOR` | Draw a clipped filled rectangle |
| `text X Y SCALE COLOR TEXT` | Draw uppercase 5×7 glyphs |
| `caina` | Commit the current canvas and optionally export a numbered frame |

Colors are `0xRRGGBB` values written as decimal integers. Frame names use the
requested prefix followed by `-000001.ppm`, `-000002.ppm`, and so on.

## Fixed limits

| Resource | Limit |
|---|---:|
| Instructions | 1,000,000 |
| Executed steps | 10,000,000 |
| Value stack | 4,096 |
| Call stack | 1,024 |
| Variables | 256 |
| Byte memory | 65,536 |
| Labels and functions | 512 |
| Fixups | 2,048 |
| Studio editor | 32,768 bytes |
