# Practical 04 — Verification of DTFT Properties

## Write-Up

**Aim:** To verify the time-shifting property of the DTFT by comparing magnitude and phase responses of an original and shifted signal.

**Theory:** The time-shifting property states that delaying a signal by (n_0) samples multiplies its DTFT by (e^{-j\omega n_0}): (x[n-n_0] \leftrightarrow e^{-j\omega n_0}X(e^{j\omega})). The delay does not change the magnitude spectrum but affects phase.

**Procedure:** Set the angular frequency range; calculate DTFT of the original sequence; apply the complex exponential for shifting; compute magnitude and phase; plot all four responses for comparison.

**Note:** The source comment labels the shift as (x(n-2)), but the code's multiplier `exp(-3j*w)` corresponds to a delay of 3 samples. The supplied expression is retained.

**Conclusion:** The DTFT time-shifting property is demonstrated by comparing the original and shifted magnitude and phase responses.