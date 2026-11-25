# Practical 10 — Implementation of IIR Filter (Butterworth Approximation)

## Write-Up

**Aim:** To design and implement an IIR low-pass Butterworth filter in MATLAB and observe the filtered output.

**Theory:** Infinite Impulse Response (IIR) filters use feedback and can have an impulse response of theoretically infinite duration. The Butterworth filter is known for a maximally flat magnitude response in its passband. The `buttord()` function determines the minimum filter order and cutoff frequency based on passband and stopband specifications. The `butter()` function generates filter coefficients, and `filter()` applies the filter.

**Given specifications:**
- Normalized passband edge frequency: 0.2
- Normalized stopband edge frequency: 0.3
- Passband ripple: 1 dB
- Stopband attenuation: 20 dB

**Procedure:**
1. Define the passband and stopband specifications.
2. Use `buttord()` to calculate filter order and cutoff frequency.
3. Design the Butterworth filter using `butter()`.
4. Plot the frequency response using `freqz()`.
5. Generate an input containing 50 Hz and 350 Hz components.
6. Filter the signal and plot the input and output to observe attenuation of the high-frequency component.

**Conclusion:** An IIR Butterworth low-pass filter was designed and implemented in MATLAB, and the filtering effect was observed by comparing the input and output signals.