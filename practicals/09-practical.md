# Practical 09 — Design and Implementation of Low-Pass FIR Filter Using Hamming Window

## Write-Up

**Aim:** To design and implement a low-pass FIR filter using the Hamming window method in MATLAB and observe its frequency response and filtering effect.

**Theory:** FIR filters have finite-duration impulse responses. A low-pass FIR filter passes low-frequency components and attenuates high-frequency components. The Hamming window reduces abrupt truncation of the ideal filter response and helps reduce sidelobes. MATLAB's `fir1()` designs the filter, while `freqz()` displays its frequency response.

**Given:**
- Input frequencies: 10 Hz, 20 Hz, and 30 Hz
- Sampling frequency: four times the maximum input frequency
- Passband edge: minimum input frequency
- Stopband edge: 1.4 times the passband edge
- Window: Hamming

**Procedure:**
1. Generate the three sinusoidal signals and combine them.
2. Set the low-pass filter specifications.
3. Calculate transition width, cutoff frequency, filter length, and order.
4. Create a Hamming window and design the FIR filter.
5. Plot the frequency response.
6. Filter the composite signal and compare original and filtered frequency spectra using FFT.

**Conclusion:** A low-pass FIR filter using a Hamming window was designed and implemented in MATLAB, and its frequency response and filtering effect were examined.