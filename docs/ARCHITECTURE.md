# Architecture

## Execution path

```text
single C stage-zero seed
        |
        v
readable native compiler.coc
        |
        v
stage 1 compiler.cob <--- canonical compiler.coc
        |                         ^
        v                         |
stage 2 compiler.cob -------------+
        |
        v
stage 3 compiler.cob
```

Stages 1, 2 and 3 are required to be byte-identical. The stage compiler also
compiles an independent signed Cocytus program to the exact seed-produced COC1
image. The fixed point is executable compiler behavior, not a stored copy.

`bootstrap/cocytus_seed.c` is the only C source. It contains the stage-zero
parser, COC1 encoder, VM, exact finite-dyadic engine, finite Conway-cut engine,
deterministic raster backend and thin X11 presentation backend.

`source/compiler-readable.coc` contains the native compiler algorithm in
symbolic Cocytus. `source/compiler-self.coc` is its canonical Cocytus form:
`image N` followed by fixed instruction records. The native compiler scans that
source, validates the canonical `image`/`native` keywords, parses signed fields, emits the COC1 header and serializes every record with bounded byte decomposition.
The C seed's `canonicalize` operation is used only to establish or inspect that
canonical source; stages 2 and 3 are emitted by Cocytus code.

The self-host claim covers this canonical compiler core. Symbol resolution,
the ergonomic source frontend, the VM, graphical host and system I/O remain in
the one C bootstrap/host seed. `source/cocytus-core.coc` still reconstructs the
shipped ELF exactly, but that carrier is not part of the self-hosted compiler path.

The VM carries semantic values as normalized `(signed numerator, exponent)`
pairs. Binary storage is an implementation carrier; the authoritative rules
are exact normalization, explicit invalid states and fail-closed bounds.

The canvas is an in-memory 640×400 RGB surface. PPM is the authoritative
headless result. X11 displays that same surface and provides the interactive
editor; it is not a separate rendering implementation.
