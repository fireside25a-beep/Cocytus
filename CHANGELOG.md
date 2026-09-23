# Changelog

## 0.2.1

- reject malformed canonical `image` and `native` keywords in the native compiler;
- replace unbounded repeated-subtraction integer serialization with bounded 64-bit byte decomposition and raise the explicit VM ceiling to 30,000,000 steps for large canonical images;
- extend stage-three native compilation to the full Studio and zone graphics bytecode;
- connect the native Studio canvas to the X11 editor surface, align Build/Run click bounds with the visible buttons, write the sibling `.cob` output path, correct the Studio version label, and repair the GUI documentation paths.

## 0.2.0

- added a native Cocytus canonical compiler with real token scanning, signed
  decimal parsing, COC1 header emission and 48-byte instruction encoding;
- added deterministic stage-zero → stage-one → stage-two → stage-three
  bootstrapping, with byte identity required across all native stages;
- made compiler-image reproduction the quine fixed point inside self-hosting;
- added readable and canonical forms of the same compiler algorithm;
- added independent signed-program compilation to prove the native compiler is
  not restricted to reproducing only its own image;
- added malformed/truncated input rejection for the native compilation path;
- retained the one-file C bootstrap/host seed, COC1 ABI, exact dyadics, finite
  Conway cuts, four Cocytus zones, deterministic graphics and Studio.

## 0.1.0

- established one readable C bootstrap/host seed and native `.coc` programs;
- retained the complete deterministic compiler, 48-byte VM, exact finite
  dyadics, finite well-founded Conway cuts, control flow, functions, variables,
  byte memory, PPM graphics and interactive X11 Studio;
- introduced COC1 bytecode;
- added Judecca declared access budgets with deterministic freezing and faults;
- added reversible Antenora input warping;
- added Caïna commits with deterministic numbered frame export;
- added Ptolomaea function-entry syntax;
- added native Studio, language, zone, arithmetic and memory programs;
- added exact executable reconstruction from native source-image code;
- adopted Apache License 2.0 for the complete project distribution.
