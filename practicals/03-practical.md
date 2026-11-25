# Practical 03 — Computation of DTFT

## Write-Up

**Aim:** To compute and plot the magnitude and phase responses of the Discrete-Time Fourier Transform (DTFT) using MATLAB.

**Theory:** The DTFT converts a discrete-time sequence into a continuous function of angular frequency. It is expressed as:

\[
X(e^{j\omega})=\sum_{n=-\infty}^{\infty}x[n]e^{-j\omega n}
\]

The magnitude indicates the strength of frequency components, while the phase indicates their phase shift.

**Procedure:**
1. Define the angular frequency range from `-pi` to `pi`.
2. Compute the frequency-domain expression for the given signal.
3. Calculate magnitude using `abs()` and phase using `angle()`.
4. Plot the magnitude and phase responses.

**Conclusion:** The DTFT magnitude and phase responses were computed and plotted using MATLAB.
