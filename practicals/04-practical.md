# Practical 04 — Time-Shifting Property of DTFT

## Aim
To verify the time-shifting property of the Discrete-Time Fourier Transform (DTFT) using MATLAB.

## Apparatus
MATLAB

## Theory and Derivation
The DTFT is defined as:
\[
X(e^{j\omega})=\sum_{n=-\infty}^{\infty}x[n]e^{-j\omega n}
\]

For the signal \(x[n]=(0.25)^n u[n]\):
\[
X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}
\]

The time-shifting property states that delaying a signal by \(n_0\) samples multiplies its DTFT by a phase factor:
\[
x[n-n_0]\ \xleftrightarrow{\mathrm{DTFT}}\ e^{-j\omega n_0}X(e^{j\omega})
\]

For a two-sample delay (\(n_0=2\)):
\[
X_s(e^{j\omega})=e^{-j2\omega}X(e^{j\omega})
\]

**Magnitude:** Since \(|e^{-j2\omega}|=1\), the magnitude is unchanged:
\[
|X_s(e^{j\omega})|=|X(e^{j\omega})|
\]

**Phase:** The phase is shifted by \(-2\omega\), modulo \(2\pi\) because phase is wrapped:
\[
\angle X_s(e^{j\omega})=\angle X(e^{j\omega})-2\omega
\]

## Algorithm
1. Clear the workspace and figures.
2. Define \(\omega=(-1:0.001:1)\pi\).
3. Compute the original DTFT \(X(e^{j\omega})=1/(1-0.25e^{-j\omega})\).
4. Calculate the delayed DTFT \(X_s(e^{j\omega})=e^{-j2\omega}X(e^{j\omega})\).
5. Find magnitude and phase of both DTFTs using `abs()` and `angle()`.
6. Plot original and delayed magnitude and phase in four subplots, then compare.
7. Stop.

## Conclusion
The original signal and its two-sample delayed version were analyzed. The magnitude spectra are identical, while the phase spectrum changes by the expected linear phase term, verifying the DTFT time-shifting property.
