# COC1 bytecode ABI

All release bytecode is little-endian and intended for the shipped Linux
x86-64 runtime.

## Header

| Offset | Size | Meaning |
|---:|---:|---|
| 0 | 4 | ASCII `COC1` |
| 4 | 1 | ABI version `1` |
| 5 | 3 | Zero reserved bytes |
| 8 | 8 | Unsigned instruction count |

## Instruction

Each instruction occupies exactly 48 bytes under the release ABI:

| Field | Type | Meaning |
|---|---|---|
| opcode | `uint8` | Operation selector |
| exponent | `uint8` | Dyadic exponent for `push` |
| padding | `uint16` plus 4 alignment bytes | Reserved, zero from both compilers |
| a, b, c, d, k | five `int64` | Operation operands, beginning at offset 8 |

The explicit layout is: opcode at offset 0, exponent at 1, eight-byte operand
alignment through offsets 2–7, operands at offsets 8, 16, 24, 32 and 40. This
accounts for the full 48-byte record and is reproduced exactly by the native
Cocytus compiler.

The runtime rejects the wrong magic, wrong version, more than 1,000,000
instructions, invalid branch targets, malformed exact values and all resource
bound violations. COC1 is not promised as a cross-endian interchange format.
