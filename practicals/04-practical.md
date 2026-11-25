# Practical 04 — Time-Shifting Property of DTFT

## Write-Up

**Aim:** To verify the time-shifting property of the Discrete-Time Fourier Transform (DTFT) using MATLAB.

**Apparatus:** MATLAB

## Theory and Derivation

The DTFT is defined as:

\[
X(e^{j\omega})=\sum_{n=-\infty}^{\infty}x[n]e^{-j\omega n}
\

For the base signal \(x[n]=(0.25)^n u[n]\):

\[
X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}
\

The time-shifting property states that delaying a sequence by \(n_0\) samples multiplies its DTFT by a linear phase factor:

\[
x[n-n_0]\ \longleftrightarrow\ e^{-j\omega n_0}X(e^{j\omega})
\

### Applying a two-sample delay (\(n_0=2\))

\[
X_s(e^{j\omega})=e^{-j2\omega}X(e^{j\omega})
\

**Magnitude:** Since \(|e^{-j2\omega}|=1\), the magnitude remains unchanged:

\[
|X_s(e^{j\omega})|=|X(e^{j\omega})|
\

**Phase:** The phase changes linearly by \(-2\omega\), subject to phase wrapping:

\[
\angle X_s(e^{j\omega})=\angle X(e^{j\omega})-2\omega
\

## Algorithm

1. Clear the workspace and figures (`clc`, `clear`, `close all`).
2. Define the frequency vector `w = (-1:0.001:1) * pi`.
3. Compute the original DTFT `X_dtft = 1 ./ (1 - 0.25 * exp(-1j * w)` and delayed DTFT `X_s = exp(-1j * 2 * w) .* X_dtft`.
4. Extract magnitude and phase of both DTFTs using `abs` and `angle`.
5. Plot all four spectra in a four-subplot figure with titles, axis labels, and grid lines. Compare the plots.
6. Stop.

## Conclusion

The DTFT of \(x[n]=(0.25)^n u[n]\) and its two-sample delayed version \(x[n-2]\) were plotted in MATLAB. The magnitude spectra are identical, while the phase spectrum changes linearly due to the delay, verifying the DTFT time-shifting property.
