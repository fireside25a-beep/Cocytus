# Frozen Lake contract

Judecca makes memory lifetime part of source semantics.

```text
judecca ADDRESS COUNT
```

`ADDRESS` is in `0..65535`; `COUNT` is a positive integer. Each address may be
declared once per execution. Every `mload` and `mstore` consumes exactly one
access from that address's budget.

For budget `N`:

1. accesses `1..N-1` succeed and leave the cell available;
2. access `N` succeeds, then freezes the resulting byte permanently;
3. access `N+1` deterministically fails with exit status 6;
4. access to an undeclared cell deterministically fails;
5. redeclaration deterministically fails.

The Nth store writes its byte before freezing it. The Nth load returns the
current byte before freezing it. No instruction can thaw a cell.

This is not a cache policy or heuristic. It is an explicit program contract,
so identical bytecode and input produce the same freeze frontier.

## Antenora

For input byte `x`, Antenora pushes

```text
w = (3x + 1) mod 256
```

The inverse is

```text
x = 171(w - 1) mod 256
```

because `3 × 171 = 513 ≡ 1 (mod 256)`. All 256 byte values are therefore
permuted without collision. End-of-file is represented separately as `-1`.
