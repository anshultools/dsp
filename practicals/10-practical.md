# Practical 10 — IIR Filter Using Butterworth Approximation

## Aim
To design and implement an Infinite Impulse Response (IIR) low-pass Butterworth filter in MATLAB and observe its filtering effect.

## Apparatus
MATLAB

## Theory
An IIR filter uses feedback and may have an impulse response that continues indefinitely. A Butterworth filter has a maximally flat magnitude response in its passband.

A digital IIR filter can be represented by a transfer function:
\[
H(z)=\frac{\sum_{k=0}^{M}b_kz^{-k}}{1+\sum_{k=1}^{P}a_kz^{-k}}
\]
The `buttord()` function determines the minimum Butterworth order and cutoff frequency for given passband and stopband constraints. The `butter()` function returns the filter coefficients, and `filter()` applies the filter to the input sequence.

### Given specifications
- Normalized passband edge: \(W_p=0.2\).
- Normalized stopband edge: \(W_s=0.3\).
- Passband ripple: \(R_p=1\,\text{dB}\).
- Stopband attenuation: \(R_s=20\,\text{dB}\).

For MATLAB's digital filter design functions, normalized frequency is measured relative to the Nyquist frequency (1 corresponds to \(F_s/2\), unless the sampling frequency is explicitly provided).

## Algorithm
1. Define the normalized passband and stopband edges and the ripple/attenuation limits.
2. Use `buttord()` to determine the filter order and cutoff frequency.
3. Design the Butterworth filter with `butter()`.
4. Plot the magnitude and phase frequency response using `freqz()`.
5. Generate an input signal containing 50 Hz and 350 Hz components (using the sampling settings in the script).
6. Apply the filter and plot the input and output to observe attenuation of the higher-frequency component.

## Conclusion
An IIR Butterworth low-pass filter was designed in MATLAB. Its frequency response and attenuation of the high-frequency component were observed by comparing the input and output.
