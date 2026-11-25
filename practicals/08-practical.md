# Practical 08 — Design and Implementation of Low-Pass FIR Filter Using Rectangular Window

## Write-Up

**Aim:** To design and implement a low-pass FIR filter using the rectangular window method in MATLAB and observe its frequency response and filtering effect.

**Theory:** A Finite Impulse Response (FIR) filter has an output that depends on a finite number of input samples. A low-pass filter allows lower-frequency components to pass while attenuating higher-frequency components. The rectangular window truncates the ideal impulse response to a finite length. The filter coefficients are designed using `fir1()`, and `freqz()` is used to view the frequency response.

**Given:**
- Input frequencies: 10 Hz, 20 Hz, and 30 Hz
- Sampling frequency: four times the maximum input frequency
- Passband edge: minimum input frequency
- Stopband edge: 1.4 times the passband edge
- Window: Rectangular

**Procedure:**
1. Generate three sinusoidal signals and combine them.
2. Calculate the sampling frequency and low-pass filter specifications.
3. Calculate the normalized transition width, cutoff frequency, filter length, and order.
4. Generate rectangular window coefficients and design the FIR low-pass filter using `fir1()`.
5. Plot the filter frequency response.
6. Filter the composite signal and compare the original and filtered frequency spectra using FFT.

**Conclusion:** A low-pass FIR filter was designed using a rectangular window in MATLAB, and its frequency response and effect on the composite signal were observed.