# COCYTUS 0.2.0 SELF-HOST PROOF

> Fill this file only from real build artifacts.
> Do not replace missing evidence with expected values.

## Trust boundary

- `C0`: visible C stage-0 trust seed
- `S`: native Cocytus compiler source (`compiler.coc`)
- `C1 = C0(S)`
- `C2 = C1(S)`
- `C3 = C2(S)`

## Artifact record

```text
C0 path:
C0 SHA-256:

S path:
S SHA-256:

C1 path:
C1 SHA-256:

C2 path:
C2 SHA-256:

C3 path:
C3 SHA-256:
```

## Fixed-point gate

```text
byte comparison C2 vs C3:
SHA-256 equality:
artifact sizes:
compiler self-tests:
language regression tests:
result:
```

The release may claim the compiler fixed point only when the real
stage-2 and stage-3 compiler artifacts are byte-identical.
