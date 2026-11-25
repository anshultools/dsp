# Practical 03 — Computation of DTFT

## Write-Up

**Aim:** To compute and plot the magnitude and phase spectra of the Discrete-Time Fourier Transform (DTFT) of \(x[n]=(0.25)^n u[n]\).

**Apparatus:** MATLAB

## Theory and Derivation

The DTFT converts a discrete-time sequence into a continuous, \(2\pi\)-periodic function of digital frequency \(\omega\):

\[
X(e^{j\omega})=\sum_{n=-\infty}^{\infty}x[n]e^{-j\omega n}
\

Given \(x[n]=(0.25)^n u[n]\), where \(u[n]=1\) for \(n\geq0\) and zero otherwise:

\[
\begin{aligned}
X(e^{j\omega})&=\sum_{n=0}^{\infty}(0.25)^n e^{-j\omega n}\\
&=\sum_{n=0}^{\infty}(0.25e^{-j\omega})^n
\

Using the infinite geometric-series formula \(\sum_{n=0}^{\infty}r^n=\frac{1}{1-r}\), valid when \(|r|<1\), and noting that \(|0.25e^{-j\omega}|=0.25<1\):

\[
\boxed{X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}}
\

An equivalent expression is:

\[
X(e^{j\omega})=\frac{e^{j\omega}}{e^{j\omega}-0.25}
\

## Algorithm

1. Clear the workspace and figures (`clc`, `clear`, `close all`).
2. Define the digital frequency vector `w = -pi:0.01:pi`.
3. Evaluate `X = 1 ./ (1 - 0.25 * exp(-1j * w))`.
4. Compute magnitude using `abs(X)` and phase using `angle(X)`.
5. Plot both spectra against \(\omega\) in a two-row subplot, with axis labels, titles, and grids.
6. Stop.

## Conclusion

The DTFT of \(x[n]=(0.25)^n u[n]\) was derived as \(X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}\), and its magnitude and phase spectra were computed and plotted using MATLAB.
