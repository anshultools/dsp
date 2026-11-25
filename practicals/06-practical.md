# Practical 06 — Verification of DFT Properties

## Aim
To verify the following properties of the Discrete Fourier Transform (DFT) using MATLAB:
1. Linearity
2. Circular time-shifting
3. Circular convolution

## Apparatus
MATLAB

## Theory
The **DFT** converts a finite set of time-domain samples into frequency-domain values. In MATLAB, the DFT and inverse DFT are calculated using `fft()` and `ifft()`.

### A) Linearity property
The DFT of a weighted sum of two signals is equal to the same weighted sum of their individual DFTs.

$$
\mathrm{DFT}\{p x_1[n]+q x_2[n]\}=pX_1[k]+qX_2[k]
$$

Here, $p$ and $q$ are constants.

### B) Circular time-shifting property
When a signal is shifted circularly in time, its DFT magnitude remains the same, but its phase changes.

For a circular shift of $m$ samples:

$$
X_s[k]=X[k]e^{-j2\pi km/N}
$$

The magnitude does not change:

$$
|X_s[k]|=|X[k]|
$$

### C) Circular convolution property
Circular convolution in the time domain is equal to the inverse DFT of the multiplied DFTs:

$$
x_1[n]\circledast x_2[n]=\mathrm{ifft}(X_1[k]\,X_2[k])
$$

In MATLAB, use `cconv()` to calculate circular convolution directly.

## Algorithm

### A) Linearity
1. Clear the workspace, command window, and figures.
2. Define $x_1=[1,2,3,4]$, $x_2=[2,1,2,1]$, $N=4$, $p=2$, and $q=3$.
3. Calculate the DFT of both signals using `fft()`.
4. Multiply the first signal by $p$ and the second signal by $q$, then add them.
5. Calculate the DFT of the combined signal.
6. Compare it with the weighted sum of the individual DFTs and plot both magnitude spectra.

### B) Circular time-shifting
1. Circularly shift $x_1$ by 3 samples using `circshift()`.
2. Calculate the DFT of the shifted signal.
3. Calculate the theoretical shifted DFT using the time-shifting formula.
4. Compare the original and shifted magnitude and phase plots.

### C) Circular convolution
1. Calculate the DFT of both input signals.
2. Multiply the two DFTs element by element.
3. Apply `ifft()` to the product to obtain circular convolution.
4. Calculate circular convolution directly using `cconv(x1,x2,N)`.
5. Compare and plot both results.

## Conclusion
The linearity, circular time-shifting, and circular convolution properties of the DFT were verified using MATLAB.
