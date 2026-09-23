# COCYTUS.NFO

```text
===============================================================================
                                  C O C Y T U S
                         NINTH CIRCLE // 0.2.0
===============================================================================

There was, apparently, still a problem.

Malbolge was named after Malebolge, Dante's eighth circle of Hell, and
was designed on the reasonable assumption that programming had become
far too pleasant.

Dante provided a ninth circle.

Cocytus used it.

Cocytus is the frozen lake at the bottom of Hell, reserved for treachery.
It is divided into Caina, Antenora, Ptolomaea and Judecca.

Those names are not decoration.

They are semantics.

Version 0.1 made the machine executable.

Version 0.2 has a less charitable requirement:

        the compiler must eventually compile itself.

Not by printing its own source.
Not by hiding a second compiler in the host.
Not by renaming a reconstructed image and calling the problem solved.

The native Cocytus compiler source must pass through Cocytus itself
until the resulting executable compiler reaches a byte-for-byte fixed
point.

This seemed preferable to trust.
```

<p align="center">
  <img src="cocytus-machine-020.svg" width="100%" alt="Cocytus 0.2 deterministic machine architecture">
</p>

---

## 00 // NUMBERS

```text
Cocytus does not ask floating point to approximate its ordinary numeric domain.

A finite dyadic value is represented exactly as

        x = N / 2^M

        N in Z
        M in N

Representations are normalized canonically.

        6/2^3 = 3/2^2

Arithmetic remains exact inside the representable domain.

        1/2 + 1/2       = 1
        (3/2)(-1/2)     = -3/4

For addition, let k = max(m,n):

        a/2^m + b/2^n
      = (a*2^(k-m) + b*2^(k-n)) / 2^k

Multiplication:

        (a/2^m)(b/2^n) = ab / 2^(m+n)

The result is normalized again.

If a result cannot be represented inside the machine's defined bounds,
Cocytus does not quietly substitute a nearby number.

It becomes unresolved.
```

Cocytus also carries bounded finite, well-founded Conway cuts:

```text
                         { L | R }

Every left option must be strictly less than every right option.

Cuts may be validated, compared, negated, added and multiplied.

Their construction carries a birthday:

        b(x) = 0                                  if x = { | }

        b(x) = 1 + max b(option)                  otherwise

A number may therefore have both a value and a construction history.

This was considered sufficiently inconvenient.
```

<p align="center">
  <img src="conway-cut.svg" width="100%" alt="Finite Conway cut and birthday structure">
</p>

---

## 01 // THE FOUR ZONES

### CAINA

```text
Caina commits visual state.

The machine owns a deterministic 640 x 400 raster.

A committed frame is required to reproduce the same bytes from the same
committed state.

Pixels have therefore acquired semantics.
```

### ANTENORA

```text
Antenora transforms each ordinary input byte x by

        A(x) = (3x + 1) mod 256

Since

        gcd(3,256) = 1

three is invertible modulo 256:

        3^-1 = 171  (mod 256)

therefore

        A^-1(y) = 171(y - 1) mod 256

The map is a permutation of the complete byte space.

        256 / 256 mappings verified reversible.

Random corruption would have been easier.
```

<p align="center">
  <img src="antenora-map.svg" width="100%" alt="Antenora reversible byte permutation">
</p>

### PTOLOMAEA

```text
Ptolomaea marks function entry and uses the machine's preserved,
bounded call/return mechanism.

There is no second imaginary stack hiding behind the first one to make
this friendlier.
```

### JUDECCA

```text
Judecca is where memory freezes.

        judecca ADDRESS COUNT

COUNT declares the permitted access budget for ADDRESS.

        access 1       permitted
        access 2       permitted
        ...
        access N       permitted; address freezes
        access N+1     fault

The frozen location is permanently immutable.

Mutable memory is therefore not merely finite in size.

It is finite in patience.

The programmer must know not only what a location contains, but how
many more times the program is allowed to know it.

This was considered an improvement.
```

<p align="center">
  <img src="judecca-freeze.svg" width="100%" alt="Judecca finite-access memory freezing rule">
</p>

---

## 02 // THE MACHINE

```text
Source extension:        .coc

Instruction form:        fixed 48-byte instructions

Numeric core:            exact finite dyadics
                         finite well-founded Conway cuts

Execution:               deterministic
                         bounded stack
                         variables
                         bounded memory
                         comparisons
                         branches
                         calls / returns
                         raster operations
                         explicit visual commit

Presentation:            deterministic 640 x 400 raster

Trust seed:              one visible C bootstrap / host seed

Native language:         .coc
```

The C file is the beginning of the trust chain.

It is not the desired end of it.

---

## 03 // THE 0.2 BOOTSTRAP FIXED POINT

Let:

```text
        C0 = the visible C trust seed
        S  = the native Cocytus compiler source written in .coc
```

Then define the compiler stages:

```text
        C1 = C0(S)
        C2 = C1(S)
        C3 = C2(S)
```

The 0.2 self-hosting gate is:

```text
        bytes(C2) = bytes(C3)

and therefore

        SHA-256(C2) = SHA-256(C3)
```

In functional form, define

```text
        Phi(C) = C(S)
```

A self-hosted compiler image is a fixed point when

```text
        Phi(C*) = C*
```

The operational witness used by Cocytus is the stage-2 / stage-3
identity:

```text
        C2 = C3
```

<p align="center">
  <img src="bootstrap-fixed-point.svg" width="100%" alt="Cocytus compiler bootstrap fixed point">
</p>

<p align="center">
  <img src="fixed-point-math.svg" width="100%" alt="Compiler fixed point mathematics">
</p>

### THIS IS NOT THE CHEAP QUINE

```text
A conventional quine establishes something like

        P -> text(P)

which proves that a program can reproduce a representation of itself.

That is amusing.

It is not the 0.2 requirement.

Cocytus requires the compiler source S to be compiled by a compiler
produced from S, and then compiled again, until the executable compiler
image itself stops changing:

        C1 = C0(S)
        C2 = C1(S)
        C3 = C2(S)

        REQUIRE: C2 == C3 byte-for-byte

The compiler is therefore reproducing its own executable form through
the semantics of its own language.

The C implementation remains visible because pretending the trust seed
never existed would be less interesting than showing it.
```

### NO HOST ESCAPE

```text
The native compiler is required to live inside the same language and
machine it compiles.

If the existing .coc instruction set cannot express the compiler
algorithm directly, the language/VM may be extended only as much as is
actually required.

The extension must then become part of the same deterministic machine
and the fixed-point test starts again.

A host-language helper that secretly performs compilation does not
count.

Renaming a stage-0 reconstruction does not count.

A compiler that happens to print itself does not count.

The bytes count.
```

---

## 04 // RELEASE GATE

The existing machine evidence remains part of the release gate.

The new bootstrap claims are not marked PASS until the artifacts exist.

```text
+------------------------------------------------------+------------------------------+
| CHECK                                                | STATUS                       |
+------------------------------------------------------+------------------------------+
| exact-dyadic property cases: 321,084                | PASS                         |
| Antenora reversible byte mappings: 256 / 256        | PASS                         |
| Ptolomaea call / return                              | PASS                         |
| Judecca exact-freeze                                 | PASS                         |
| Judecca undeclared / overuse / redeclaration         | PASS AS NEGATIVE TESTS       |
| Caina frame and final-image reproducibility          | PASS                         |
+------------------------------------------------------+------------------------------+
| native compiler source S in .coc                     | REQUIRED FOR 0.2             |
| C1 = C0(S)                                           | REQUIRED FOR 0.2             |
| C2 = C1(S)                                           | REQUIRED FOR 0.2             |
| C3 = C2(S)                                           | REQUIRED FOR 0.2             |
| bytes(C2) == bytes(C3)                               | MUST PASS BEFORE CLAIM       |
| SHA-256(C2) == SHA-256(C3)                           | MUST PASS BEFORE CLAIM       |
+------------------------------------------------------+------------------------------+
```

<p align="center">
  <img src="release-gate-020.svg" width="100%" alt="Cocytus 0.2 release validation gate">
</p>

```text
A failure test that is accepted is a failed test.

A self-hosting claim without the fixed-point artifacts is also a failed
test.

The machine is expected to be rude for the correct reason.
```

---

## 05 // MALBOLGE

```text
Cocytus is not Malbolge with several new opcodes attached.

Malbolge supplied the precedent.

Cocytus uses its own machine.

Malbolge arranged for the instruction stream to betray the programmer.

Cocytus instead combines:

        exact arithmetic
        finite Conway construction
        reversible byte transformation
        bounded execution
        deterministic visual commitment
        finite-access mutable state
        and, in 0.2, a compiler required to reproduce its own
        executable form through its own language.

Malbolge occupied the eighth circle.

There was still a ninth.
```

---

## 06 // LICENSE

```text
Cocytus is released under the Apache License 2.0.

This is not the public domain.

Even Hell has paperwork.
```

---

```text
===============================================================================

Malbolge made the instruction stream betray the programmer.

Cocytus gives the programmer a finite number of chances before the
machine freezes the evidence.

Version 0.2 adds one more courtesy:

        the compiler must prove that it can survive itself.

Have fun.

                                 COCYTUS
                        Ninth circle. Now recursive.

===============================================================================
```
