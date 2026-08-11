#!/usr/bin/env python3
"""High-precision arithmetic check for the refined simple-zero bound.

This script verifies only the exact constant arithmetic and scans the block
size among the stated admissible block hypotheses.  It does not replace the inherited Arb
interval certificates or prove the analytic number-theory inputs.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass

import mpmath as mp


mp.mp.dps = 100

ALPHA = mp.mpf(19) / 5000
EPS_TRIANGLE = mp.mpf(221) / 1_000_000
H_MT = mp.mpf(3) / 2 - 1 / mp.sqrt(2) / mp.tan(1 / mp.sqrt(2))


@dataclass(frozen=True)
class BoundData:
    block_size: int
    local_target: mp.mpf
    spectral_target: mp.mpf
    pressure: mp.mpf
    proportion: mp.mpf


def gamma(m: int, q: mp.mpf) -> mp.mpf:
    """The low-energy correlation-matrix envelope Gamma_m(q)."""
    threshold = mp.mpf(m) / (m - 1)
    if q <= threshold:
        return q
    if q > 2:
        raise ValueError("the low-energy branch is used only for q <= 2")
    return q / m + 2 * mp.sqrt(mp.mpf(m - 1) * q / m) - 1


def phi(m: int, q: mp.mpf) -> mp.mpf:
    """The global correlation-matrix envelope Phi_m(q)."""
    threshold = mp.mpf(m) / (m - 1)
    if q <= threshold:
        return q
    return 2 * mp.sqrt(mp.mpf(m) * q / (m - 1)) - threshold


def complete_scheme(m: int) -> BoundData:
    """Return the bound with exact incidence, edge triangles, and Gamma_m."""
    if m < 10:
        raise ValueError("the edge-triangle packing is stated for m >= 10")
    local_target = ALPHA * (m - 6) + 4 * EPS_TRIANGLE
    if local_target >= 2:
        raise ValueError("local target leaves the stated low-energy regime")
    spectral_target = gamma(m, local_target)
    if not spectral_target < min(gamma(m, mp.mpf(2)), phi(m, mp.mpf(2))):
        raise ValueError("the high-energy spectral margin is not satisfied")
    pressure = mp.mpf(m - 6) / (500 * m) + 2 * EPS_TRIANGLE / m
    proportion = (H_MT - pressure) / (1 - spectral_target / m)
    return BoundData(m, local_target, spectral_target, pressure, proportion)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--start", type=int, default=10)
    parser.add_argument("--stop", type=int, default=600)
    args = parser.parse_args()

    chosen = complete_scheme(272)
    print(f"H_MT              = {mp.nstr(H_MT, 80)}")
    print(f"m                 = {chosen.block_size}")
    print(f"A_m               = {mp.nstr(chosen.local_target, 80)}")
    print(f"B_m               = {mp.nstr(chosen.spectral_target, 80)}")
    print(f"C_m               = {mp.nstr(chosen.pressure, 80)}")
    print(f"refined proportion= {mp.nstr(chosen.proportion, 90)}")
    print(f"percentage        = {mp.nstr(100 * chosen.proportion, 70)}%")

    previous = (mp.mpf(1_345_000) * H_MT - 2_680) / 1_340_003
    print(f"repository bound  = {mp.nstr(previous, 80)}")
    print(f"absolute gain     = {mp.nstr(chosen.proportion - previous, 80)}")
    print(f"percentage points = {mp.nstr(100 * (chosen.proportion - previous), 80)}")

    candidates: list[BoundData] = []
    for m in range(args.start, args.stop + 1):
        try:
            candidates.append(complete_scheme(m))
        except ValueError:
            continue
    if not candidates:
        raise RuntimeError("the requested scan interval contains no admissible block size")
    best = max(candidates, key=lambda item: item.proportion)
    print(
        f"best admissible m in [{args.start}, {args.stop}]: "
        f"m={best.block_size}, R={mp.nstr(best.proportion, 50)}"
    )

    A_exact = mp.mpf(252_921) / 250_000
    B_exact = (
        mp.mpf(252_921) / 68_000_000
        + 2 * mp.sqrt(mp.mpf(68_541_591) / 68_000_000)
        - 1
    )
    C_exact = mp.mpf(266_221) / 136_000_000
    assert mp.almosteq(chosen.local_target, A_exact)
    assert mp.almosteq(chosen.spectral_target, B_exact)
    assert mp.almosteq(chosen.pressure, C_exact)
    assert best.block_size == 272


if __name__ == "__main__":
    main()
