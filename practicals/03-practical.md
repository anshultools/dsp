# Practical 03 — Computation of DTFT

## Aim
To calculate the Discrete-Time Fourier Transform (DTFT) of the signal $x[n]=(0.25)^n u[n]$ and plot its magnitude and phase.

## Apparatus
MATLAB

## Theory and Calculations

The **DTFT** converts a discrete-time signal into its frequency-domain representation.

Given signal:

$$
x[n]=(0.25)^n u[n]
$$

Here, $u[n]$ is the unit-step signal. It is equal to 1 for $n\geq0$ and 0 for $n<0$.

For this signal, the DTFT is:

$$
X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}
$$

An equivalent form is:

$$
X(e^{j\omega})=\frac{e^{j\omega}}{e^{j\omega}-0.25}
$$

The magnitude spectrum is $|X(e^{j\omega})|$, and the phase spectrum is $\angle X(e^{j\omega})$.

## Algorithm

1. Define the frequency range from $-\pi$ to $\pi$ with an increment of 0.01.
2. Calculate the DTFT using `X = 1 ./ (1 - 0.25 * exp(-1j * w))`.
3. Find the magnitude using `abs(X)`.
4. Find the phase using `angle(X)`.
5. Plot the magnitude and phase against the frequency axis using two subplots.

## Conclusion

The DTFT of $x[n]=(0.25)^n u[n]$ was calculated. Its magnitude and phase spectra were successfully plotted using MATLAB.
