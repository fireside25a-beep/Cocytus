# Provenance

Cocytus 0.2.1 continues from the recovered, verified 0.7 pre-Cocytus seed source
used for Cocytus 0.1.0.
Before the fork, that source compiled with GCC C11 `-O2` to a 51,936-byte ELF
whose SHA-256 was
`b6ea43d96ffcdd4b38a585486fcdaac1f916631106342b30913e2f7b60cb5bec`.

The pre-fork source SHA-256 was
`6d18668806de33aa2e7b99446d9acbe50b81ba36d52a36ce0f0487ed90c063f2`.
Those two identities established the exact source-to-binary origin before any
Cocytus changes. Version 0.2 retains that single-source bootstrap boundary and
adds the Cocytus-authored compiler fixed point; it does not import a compiler or
quine implementation from another project.

The fork retains the compiler, deterministic VM, exact finite dyadics, finite
well-founded Conway cuts, control flow, functions, variables, byte memory,
raster pipeline and X11 presentation. It changes the product identity and
bytecode magic, removes the unrelated compatibility command, and adds the four
Cocytus zone contracts.

No third-party source or binary is bundled. The optional interactive backend
links to the host-provided X11 runtime library. All distributed project material
is covered by the repository Apache License 2.0.
