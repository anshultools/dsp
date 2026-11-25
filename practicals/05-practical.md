# Practical 05 — DFT

## Write-Up

**Aim:** To generate a composite sinusoidal signal and identify its frequency components using the DFT in MATLAB.

**Theory:** The Discrete Fourier Transform converts a finite sequence of samples from time domain to frequency domain. It reveals the signal's frequency components. MATLAB's `fft()` computes the DFT efficiently.

**Given:** Sinusoidal frequencies 10 Hz, 50 Hz, and 100 Hz; sampling frequency four times the maximum component frequency; DFT length 128.

The composite signal is (x[n]=x_1[n]+x_2[n]+x_3[n]).

**Procedure:** Define frequencies; calculate sampling frequency and sample-time vector; generate the three sinusoids and sum them; plot the composite waveform; compute FFT magnitude; calculate frequency-axis values; plot the frequency spectrum.

**Conclusion:** The composite sinusoidal signal was generated, and its frequency components were investigated using the DFT/FFT magnitude spectrum in MATLAB.