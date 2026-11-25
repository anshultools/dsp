# Practical 04 — Time-Shifting Property of DTFT

## Aim
To verify the time-shifting property of the Discrete-Time Fourier Transform (DTFT) using MATLAB.

## Apparatus
MATLAB

## Theory
The input signal is:

$$
x[n]=(0.25)^n u[n]
$$

Its DTFT is:

$$
X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}
$$

The **time-shifting property** states that delaying a signal changes its phase but does not change its magnitude.

For a delay of $n_0$ samples, the shifted DTFT is:

$$
X_s(e^{j\omega})=e^{-j\omega n_0}X(e^{j\omega})
$$

In this practical, the signal is delayed by 2 samples. Therefore:

$$
X_s(e^{j\omega})=e^{-j2\omega}X(e^{j\omega})
$$

The magnitude remains the same:

$$
|X_s(e^{j\omega})|=|X(e^{j\omega})|
$$

The phase changes by $-2\omega$ radians.

## Algorithm
1. Clear the MATLAB workspace and close all figures.
2. Create a frequency vector from $-\pi$ to $\pi$.
3. Calculate the original DTFT using $X(e^{j\omega})=1/(1-0.25e^{-j\omega})$.
4. Apply a two-sample delay by multiplying the original DTFT by $e^{-j2\omega}$.
5. Calculate the magnitude and phase of both signals using `abs()` and `angle()`.
6. Plot the original and delayed magnitude and phase in four subplots.
7. Compare the plots.

## Conclusion
The time-shifting property of the DTFT was verified using MATLAB. The magnitude remained unchanged, while the phase shifted due to the two-sample delay.
