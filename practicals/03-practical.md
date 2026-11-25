# Practical 03 — Computation of DTFT

## Aim
To calculate and plot the magnitude and phase of the Discrete-Time Fourier Transform (DTFT) of the signal $x[n]=(0.25)^n u[n]$.

## Apparatus
MATLAB

## Theory
The **DTFT** converts a discrete-time signal into its frequency-domain representation.

The input signal is:

$$
x[n]=(0.25)^n u[n]
$$

Here, $u[n]$ is the unit-step signal. It is 1 for $n\geq0$ and 0 for $n<0$.

For this signal, the DTFT is:

$$
X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}
$$

The magnitude of the DTFT is $|X(e^{j\omega})|$, and its phase is $\angle X(e^{j\omega})$. The DTFT repeats after every $2\pi$ radians.

## Algorithm
1. Clear the MATLAB workspace and close all figures.
2. Create a frequency vector from $-\pi$ to $\pi$ using a step of 0.01.
3. Calculate the DTFT using `X = 1 ./ (1 - 0.25 * exp(-1j*w))`.
4. Calculate the magnitude using `abs(X)`.
5. Calculate the phase using `angle(X)`.
6. Plot the magnitude and phase in two separate subplots.

## Conclusion
The DTFT of $x[n]=(0.25)^n u[n]$ was calculated. Its magnitude and phase spectra were plotted using MATLAB.
