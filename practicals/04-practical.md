# Practical 04 — Verification of DTFT Properties

## Write-Up

**Aim:** To verify the time-shifting property of the DTFT using MATLAB by comparing the magnitude and phase responses of an original signal and a shifted signal.

**Theory:** The time-shifting property states that delaying a discrete-time signal by (n_0) samples multiplies its DTFT by a complex exponential:

\[
x[n-n_0] \leftrightarrow e^{-j\omega n_0}X(e^{j\omega})
\]

A delay changes the phase response but does not change the magnitude response.

**Procedure:**
1. Define the angular frequency range.
2. Compute the DTFT of the original signal.
3. Multiply by the complex exponential to model a delay.
4. Compute magnitude and phase for both signals.
5. Plot the four responses for comparison.

**Note:** The supplied code comment mentions a shift of 2 samples, but its multiplier is `exp(-3j*w)`, which corresponds to a delay of 3 samples. The uploaded MATLAB script preserves this source expression.

**Conclusion:** The DTFT time-shifting property was illustrated by comparing the magnitude and phase responses of the original and shifted signals.
