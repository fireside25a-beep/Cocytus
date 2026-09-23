# Seed map

`bootstrap/cocytus_seed.c` is intentionally one file. Its responsibilities are:

- `.coc` parsing, symbol resolution and COC1 emission;
- exact finite-dyadic normalization, arithmetic and comparison;
- bounded stack, call stack, variables and byte memory;
- Judecca declaration, access accounting, freezing and deterministic faults;
- Antenora input permutation;
- Caïna commit accounting and numbered PPM frame export;
- Ptolomaea function entries and preserved calls/returns;
- deterministic 640×400 raster primitives;
- optional X11 presentation and live editor;
- finite well-founded Conway-cut parsing, validation and arithmetic;
- built-in property tests and the machine-readable `about` contract.

The seed establishes stage one and exposes deterministic canonicalization for
auditing exact COC1 records. After that boundary,
`source/compiler-self.coc` is compiled by `bin/cocytus-compiler.cob` itself;
stages two and three do not invoke the C frontend.

`source/cocytus-core.coc` is generated from the shipped executable and emits it
byte for byte. It is an executable image carrier, not a second implementation
of the compiler algorithm.

`source/compiler-readable.coc` and `source/compiler-self.coc` are two source
views of one compiler image. The first exposes the algorithm with labels and
functions. The second is the exact canonical source consumed at the compiler
fixed point.
