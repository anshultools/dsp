# Practical 04 — Time-Shifting Property of DTFT

## Aim
To verify the time-shifting property of the Discrete-Time Fourier Transform (DTFT) using MATLAB.

## Apparatus
MATLAB

## Theory and Calculations

The **time-shifting property** states that delaying a signal changes the phase of its DTFT but does not change the magnitude spectrum.

The base signal is:

$$
x[n]=(0.25)^n u[n]
$$

Its DTFT is:

$$
X(e^{j\omega})=\frac{1}{1-0.25e^{-j\omega}}
$$

For a delay of $n_0$ samples, the shifted DTFT is:

$$
X_s(e^{j\omega})=e^{-j\omega n_0}X(e^{j\omega})
$$

In this practical, the signal is delayed by 2 samples. Therefore:

$$
X_s(e^{j\omega})=e^{-j2\omega}X(e^{j\omega})
$$

The magnitude remains unchanged:

$$
|X_s(e^{j\omega})|=|X(e^{j\omega})|
$$

The phase changes by $-2\omega$ radians, with phase wrapping in the plotted result.

## Algorithm

1. Define the frequency range as $\omega=(-1:0.001:1)\pi$.
2. Calculate the DTFT of the original signal.
3. Calculate the DTFT of the delayed signal by multiplying the original DTFT by $e^{-j2\omega}$.
4. Calculate the magnitude and phase of both signals using `abs()` and `angle()`.
5. Plot the original magnitude, original phase, shifted magnitude, and shifted phase in four subplots.
6. Compare the plots.

## Conclusion

The time-shifting property of the DTFT was verified using MATLAB. The magnitude spectrum remained unchanged, while the phase changed by the expected linear phase term of $-2\omega$.
