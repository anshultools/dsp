# Practical 05 — DFT

## Write-Up

**Aim:** To generate a composite sinusoidal signal and detect its frequency components using the Discrete Fourier Transform (DFT) in MATLAB.

**Theory:** The Discrete Fourier Transform converts a finite sequence of time-domain samples into frequency-domain samples. It helps identify the frequency components present in a signal. MATLAB's `fft()` function computes the DFT efficiently.

**Given:**
- Frequencies: 10 Hz, 50 Hz, and 100 Hz
- Sampling frequency: four times the highest component frequency
- DFT length: 128

The composite signal is formed by adding the three sinusoidal signals:

\[
x[n]=x_1[n]+x_2[n]+x_3[n]
\]

**Procedure:**
1. Set the three sinusoidal frequencies.
2. Calculate the sampling frequency and time vector.
3. Generate each sinusoid and add them to form a composite signal.
4. Plot the composite signal.
5. Apply the FFT, take its magnitude, calculate the frequency axis, and plot the detected frequency components.

**Conclusion:** The composite signal was generated in MATLAB, and its frequency components were examined using the DFT/FFT magnitude spectrum.
