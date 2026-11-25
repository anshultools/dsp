# Practical 06 — Verification of DFT Properties

## Aim
To verify the linearity, time-shifting, and circular convolution properties of the Discrete Fourier Transform (DFT) using MATLAB.

## Apparatus
MATLAB

## Theory and Calculations

The **DFT** converts a finite set of time-domain samples into frequency-domain values. MATLAB uses `fft()` to calculate the DFT and `ifft()` to calculate the inverse DFT.

### A) Linearity property

The DFT of a weighted sum of two signals is equal to the same weighted sum of their individual DFTs:

$$
\mathrm{DFT}\{p x_1[n]+q x_2[n]\}=pX_1[k]+qX_2[k]
$$

Here, $p$ and $q$ are constants.

### B) Circular time-shifting property

A circular shift changes the phase of the DFT but does not change its magnitude.

For a circular shift of $m$ samples:

$$
X_s[k]=X[k]e^{-j2\pi km/N}
$$

The magnitude remains the same:

$$
|X_s[k]|=|X[k]|
$$

### C) Circular convolution property

Circular convolution in the time domain is equal to the inverse DFT of the product of the two DFTs:

$$
x_c[n]=\mathrm{IDFT}\{X_1[k]X_2[k]\}
$$

In MATLAB, circular convolution can also be calculated directly using `cconv()`.

## Algorithm

### A) Linearity

1. Define two sequences, $x_1=[1,2,3,4]$ and $x_2=[2,1,2,1]$, with $N=4$.
2. Set the constants $p=2$ and $q=3$.
3. Calculate the DFT of both sequences using `fft()`.
4. Calculate the DFT of the combined sequence $p x_1+q x_2$.
5. Compare it with the weighted sum of the individual DFTs and plot both magnitude spectra.

### B) Circular time-shifting

1. Circularly shift $x_1$ by 3 samples using `circshift()`.
2. Calculate the DFT of the shifted sequence.
3. Calculate the theoretical shifted DFT using the time-shifting formula.
4. Compare the original and shifted magnitude and phase plots.

### C) Circular convolution

1. Calculate the DFT of both input sequences.
2. Multiply the two DFTs element by element.
3. Apply `ifft()` to obtain the circular convolution.
4. Calculate circular convolution directly using `cconv(x1,x2,N)`.
5. Compare and plot both results.

## Conclusion

The linearity, circular time-shifting, and circular convolution properties of the DFT were verified using MATLAB.
