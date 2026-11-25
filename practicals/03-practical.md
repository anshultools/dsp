# Practical 03 — Computation of DTFT

## Aim
To compute and plot the magnitude and phase spectra of the Discrete-Time Fourier Transform (DTFT) of \(x[n]=(0.25)^n u[n]\).

## Apparatus
MATLAB

## Theory and Derivation
The DTFT of a discrete-time sequence is defined as:

\[
X(e^{j\omega})=\sum_{n=-\infty}^{\infty}x[n]e^{-j\omega n}
\]

It is a continuous function of digital frequency \(\omega\) and repeats every \(2\pi\).

Given:
\[
x[n]=(0.25)^n u[n]
\]
where \(u[n]=1\) for \(n\geq0\), and \(u[n]=0\) for \(n<0\).

\[
\begin{aligned}
X(e^{j\omega})&=\sum_{n=0}^{\infty}(0.25)^n e^{-j\omega n}\\
&=\sum_{n=0}^{\infty}(0.25e^{-j\omega})^n
\end{aligned}
\]

Using the geometric-series formula \(\sum_{n=0}^{\infty}r^n=1/(1-r)\) for \(|r|<1\):

\[
\boxed{X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}}
\]

Since \(|0.25e^{-j\omega}|=0.25<1\), the series converges. An equivalent form is:

\[
X(e^{j\omega})=\frac{e^{j\omega}}{e^{j\omega}-0.25}
\]

The magnitude and phase are \(|X(e^{j\omega})|\) and \(\angle X(e^{j\omega})\), respectively.

## Algorithm
1. Clear the workspace and figures.
2. Create the digital frequency vector \(\omega=-\pi:0.01:\pi\).
3. Evaluate \(X(e^{j\omega})=1/(1-0.25e^{-j\omega})\).
4. Calculate magnitude using `abs()` and phase using `angle()`.
5. Plot magnitude and phase against \(\omega\) using two subplots.
6. Stop.

## Conclusion
The DTFT of \(x[n]=(0.25)^n u[n]\) was derived and its magnitude and phase spectra were computed and plotted in MATLAB.
