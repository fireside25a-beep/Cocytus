# Bootstrap fixed point

Let `S` be the compiler source written in Cocytus and let `C0` be the
visible stage-0 C trust seed.

Define

\[
C_1 = C_0(S), \qquad
C_2 = C_1(S), \qquad
C_3 = C_2(S).
\]

Equivalently, define the stage operator

\[
\Phi(C) = C(S).
\]

A compiler image \(C^\*\) is at the bootstrap fixed point when

\[
\Phi(C^\*) = C^\*.
\]

For Cocytus 0.2.0 the operational witness is:

\[
\operatorname{bytes}(C_2)=\operatorname{bytes}(C_3).
\]

A matching SHA-256 digest is recorded as a convenient artifact witness,
while the byte comparison is the actual equality test.

This is stronger than an ordinary source-printing quine.  The object
being reproduced is the executable compiler image obtained by compiling
the compiler through the language it implements.
