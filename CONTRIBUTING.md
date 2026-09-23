# Contributing

Changes must preserve the exact execution contracts.

- Add a failing regression before changing semantics.
- Keep all user-facing programs in `.coc`.
- Keep exactly one C source file: `bootstrap/cocytus_seed.c`.
- Do not replace exact dyadics with floating point.
- Preserve the 48-byte instruction ABI unless a new bytecode version is made.
- Treat malformed input, resource exhaustion and undeclared memory as errors.
- Regenerate `source/cocytus-core.coc` after seed changes.
- Run `./BUILD.sh` and `./SELFHOST.sh` before submitting compiler or runtime changes.

Contributions intentionally submitted to this project are accepted under
Apache License 2.0 section 5 unless explicitly stated otherwise.
