# Practical 06 — Verification of DFT Properties

## Aim
To verify these three properties of the Discrete Fourier Transform (DFT) using MATLAB:
1. Linearity
2. Circular time-shifting
3. Circular convolution

## Apparatus
MATLAB

## Theory

The **Discrete Fourier Transform (DFT)** converts a finite sequence of time-domain samples into frequency-domain values. For a sequence of length \(N\), its DFT is:

\[
X[k]=\sum_{n=0}^{N-1}x[n]e^{-j2\pi kn/N},\quad k=0,1,\ldots,N-1
\]

Here, \(x[n]\) is the input sequence, \(X[k]\) is its DFT, \(N\) is the number of samples, and \(k\) is the frequency-bin index.

### A) Linearity Property

The DFT of a weighted sum of two sequences equals the same weighted sum of their individual DFTs.

If

\[
x_1[n]\ \xleftrightarrow{\mathrm{DFT}}\ X_1[k],\qquad
x_2[n]\ \xleftrightarrow{\mathrm{DFT}}\ X_2[k]
\]

then

\[
\mathrm{DFT}\{p x_1[n]+q x_2[n]\}
=pX_1[k]+qX_2[k]
\]

where \(p\) and \(q\) are constants.

### B) Circular Time-Shifting Property

A circular shift of a sequence by \(m\) samples changes the phase of its DFT but does not change its magnitude.

\[
x_s[n]=x[(n-m)\bmod N]
\]

\[
X_s[k]=X[k]e^{-j2\pi km/N}
\]

Therefore, the magnitude spectra are equal:

\[
|X_s[k]|=|X[k]|
\]

The phase changes by \(-2\pi km/N\) (with phase wrapping as displayed by MATLAB).

### C) Circular Convolution Property

The circular convolution of two length-\(N\) sequences is:

\[
x_c[n]=\sum_{r=0}^{N-1}x_1[r]x_2[(n-r)\bmod N]
\]

The DFT property states:

\[
x_1[n]\circledast x_2[n]
\ \xleftrightarrow{\mathrm{DFT}}\ X_1[k]X_2[k]
\]

Thus, circular convolution in the time domain is equal to the inverse DFT of the product of the two DFTs:

\[
x_c[n]=\mathrm{IDFT}\{X_1[k]X_2[k]\}
\]

MATLAB functions used: `fft()`, `ifft()`, `circshift()`, `cconv()`, `stem()`, `abs()`, and `angle()`.

## Algorithm

### A) Linearity
1. Clear the workspace, command window, and figures.
2. Define \(x_1=[1,2,3,4]\), \(x_2=[2,1,2,1]\), \(N=4\), \(p=2\), and \(q=3\).
3. Compute the DFTs \(X_1[k]\) and \(X_2[k]\) using `fft()`.
4. Form \(x_3[n]=p x_1[n]+q x_2[n]\) and compute \(X_3[k]=\mathrm{fft}(x_3,N)\).
5. Calculate \(X_4[k]=pX_1[k]+qX_2[k]\).
6. Compare \(X_3[k]\) and \(X_4[k]\) (allowing for small floating-point rounding differences) and plot both magnitude spectra.

### B) Circular Time-Shifting
1. Circularly shift \(x_1[n]\) by \(m=3\) samples using `circshift()`.
2. Compute the shifted sequence's DFT, \(X_s[k]\).
3. Compute the theoretical result \(X[k]e^{-j2\pi km/N}\), for \(k=0,1,2,3\).
4. Compare the actual and theoretical shifted DFTs.
5. Plot the original and shifted magnitude and phase spectra. The magnitude plots should match; the phase plots should show the expected shift.

### C) Circular Convolution
1. Multiply the DFTs point-by-point: \(X_1[k]X_2[k]\).
2. Apply `ifft()` to obtain the circular convolution from the frequency-domain product.
3. Compute circular convolution directly using `cconv(x1,x2,N)`.
4. Compare the two results (allowing small rounding differences) and plot them.

## Conclusion
The linearity, circular time-shifting, and circular convolution properties of the DFT were verified in MATLAB. The results show that a linear combination in the time domain produces the corresponding linear combination of DFTs, a circular time shift preserves magnitude and changes phase, and circular convolution equals the inverse DFT of the product of the two DFTs.
