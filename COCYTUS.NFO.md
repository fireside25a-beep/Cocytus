# COCYTUS.NFO

```text
===============================================================================
                                  C O C Y T U S
                         NINTH CIRCLE // 0.2.1
===============================================================================

There was, apparently, still a problem.

Malbolge was named after Malebolge, Dante's eighth circle of Hell, and was
built on the reasonable assumption that programming had become far too
pleasant.

Dante provided a ninth circle.

Cocytus used it.

Cocytus is the frozen lake at the bottom of Hell, divided into Caina,
Antenora, Ptolomaea and Judecca.

Those names are not decoration.

They are semantics.

Version 0.1 made the machine executable.
Version 0.2 required the compiler to survive itself.
Version 0.2.1 carries that fixed point as part of the compiler design.

Not by printing its own source.
Not by hiding a second compiler in the host.
Not by renaming a reconstructed image and calling the problem solved.

The native Cocytus compiler source passes through Cocytus until the compiler
image stops changing byte-for-byte.

This seemed preferable to trust.

-------------------------------------------------------------------------------
00 // NUMBERS
-------------------------------------------------------------------------------

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

Cocytus also carries bounded finite, well-founded Conway cuts:

                         { L | R }

Every left option must be strictly less than every right option.

Cuts may be validated, compared, negated, added and multiplied.
Their construction carries a birthday:

        b(x) = 0                         if x = { | }
        b(x) = 1 + max b(option)         otherwise

A number may therefore have both a value and a construction history.

This was considered sufficiently inconvenient.

-------------------------------------------------------------------------------
01 // THE FOUR ZONES
-------------------------------------------------------------------------------

CAINA

Caina commits visual state.
The machine owns a deterministic 640 x 400 raster.
A committed frame must reproduce the same bytes from the same committed state.

Pixels have therefore acquired semantics.

ANTENORA

Antenora transforms each ordinary input byte x by

        A(x) = (3x + 1) mod 256

Since

        gcd(3,256) = 1

three is invertible modulo 256:

        3^-1 = 171  (mod 256)

therefore

        A^-1(y) = 171(y - 1) mod 256

The map is a permutation of the complete byte space.

        reversible across all 256 byte values.

Random corruption would have been easier.

PTOLOMAEA

Ptolomaea marks function entry and uses the machine's preserved, bounded
call/return mechanism.

There is no second imaginary stack hiding behind the first one to make this
friendlier.

JUDECCA

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

The programmer must know not only what a location contains, but how many more
times the program is allowed to know it.

This was considered an improvement.

-------------------------------------------------------------------------------
02 // THE MACHINE
-------------------------------------------------------------------------------

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

The C file is the beginning of the trust chain.
It is not disguised as the end of it.

-------------------------------------------------------------------------------
03 // THE COMPILER FIXED POINT
-------------------------------------------------------------------------------

Let:

        C0 = the visible C trust seed
        S  = the native Cocytus compiler source written in .coc

Define:

        C1 = C0(S)
        C2 = C1(S)
        C3 = C2(S)

and

        Phi(C) = C(S)

A self-hosted compiler image is a fixed point when

        Phi(C*) = C*

The compiler fixed point is carried through three consecutive images:

        bytes(C1) = bytes(C2) = bytes(C3)

All three compiler images have SHA-256:

        56dfe31a0e0cbc73fd46dd484e970af820fc0ce0b91ad9a73f99a2c59d855bc6

THIS IS NOT THE CHEAP QUINE

A conventional quine establishes something like

        P -> text(P)

which proves that a program can reproduce a representation of itself.

That is amusing.

It is not the Cocytus requirement.

Cocytus requires compiler source S to be compiled into an executable compiler
image, then passed through that compiler again until the executable image itself
stops changing.

        C1 = C0(S)
        C2 = C1(S)
        C3 = C2(S)

        REQUIRE: C1 == C2 == C3 byte-for-byte

The compiler reproduces its own executable form through the semantics of its
own canonical language path.

The visible C seed remains the runtime host boundary.  The richer VM, Conway
engine, graphics and host integration remain in that single C seed; the
canonical compiler core is the component proven at the self-hosted fixed point.

Pretending the trust seed never existed would be less interesting than showing
it.

-------------------------------------------------------------------------------
04 // MALBOLGE
-------------------------------------------------------------------------------

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
        and a compiler required to reproduce its own executable form
        through its own canonical language path.

Malbolge occupied the eighth circle.

There was still a ninth.

-------------------------------------------------------------------------------
05 // LICENSE
-------------------------------------------------------------------------------

Cocytus is released under the Apache License 2.0.

This is not the public domain.

Even Hell has paperwork.

===============================================================================

Malbolge made the instruction stream betray the programmer.

Cocytus gives the programmer a finite number of chances before the machine
freezes the state.

Version 0.2.1 adds one final courtesy:

        the compiler has already been made to survive itself.

Have fun.

                                 COCYTUS
                         Ninth circle. Recursive.

===============================================================================
```
