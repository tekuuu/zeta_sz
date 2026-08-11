#!/usr/bin/env python3
"""Exact rational checks for the local pair and pressure bookkeeping.

This script is a transparent sanity check for the new combinatorial layer.  It
is not needed as a trusted numerical oracle: every assertion is finite rational
arithmetic and is also written out in the manuscript.
"""

from __future__ import annotations

from fractions import Fraction


def seven_pair_coefficient(m: int, i: int, j: int) -> Fraction:
    """Coefficient of pair (i,j), with 1-based point indices, in W_7."""
    if not (1 <= i < j <= m):
        raise ValueError((m, i, j))
    span = j - i
    if span > 6:
        return Fraction(0)
    starts = 0
    for a in range(1, m - 5):
        if a <= i and j <= a + 6:
            starts += 1
    return Fraction(2 * starts, 7 - span)


def main() -> None:
    m = 272
    eps = Fraction(221, 1_000_000)

    incidences = []
    for gap in range(1, m):
        count = sum(1 for a in range(1, m - 5) if a <= gap <= a + 5)
        incidences.append(count)
    assert sum(incidences) == 6 * (m - 6)

    triangles = [
        (1, Fraction(4, 3)),
        (3, Fraction(2, 3)),
        (m - 4, Fraction(2, 3)),
        (m - 2, Fraction(4, 3)),
    ]
    added: dict[tuple[int, int], Fraction] = {}
    for start, weight in triangles:
        points = (start, start + 1, start + 2)
        for a, b in ((points[0], points[1]), (points[1], points[2]), (points[0], points[2])):
            added[(a, b)] = added.get((a, b), Fraction(0)) + weight

    maximum = Fraction(0)
    for i in range(1, m + 1):
        for j in range(i + 1, m + 1):
            total = seven_pair_coefficient(m, i, j) + added.get((i, j), Fraction(0))
            maximum = max(maximum, total)
            assert total <= 2, (i, j, total)
    assert maximum == 2

    pressure_sum = Fraction(0)
    for _, weight in triangles:
        pressure_sum += 2 * Fraction(1, 4) * eps * weight
    assert pressure_sum == 2 * eps

    print(f"m={m}")
    print(f"sum nu_j={sum(incidences)}=6(m-6)")
    print(f"maximum combined pair coefficient={maximum}")
    print(f"triangle pressure coefficient sum={pressure_sum}=2 epsilon_triangle")
    print("all exact combinatorial assertions passed")


if __name__ == "__main__":
    main()
