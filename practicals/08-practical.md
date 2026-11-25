# Practical 08 — Low-Pass FIR Filter Using Rectangular Window

## Aim
To design and implement a low-pass Finite Impulse Response (FIR) filter using the rectangular-window method in MATLAB and observe its frequency response and filtering effect.

## Apparatus
MATLAB

## Theory
An FIR filter has an impulse response of finite duration and can be represented by:
\[
y[n]=\sum_{k=0}^{M}b[k]x[n-k]
\]
where \(b[k]\) are filter coefficients and \(M\) is the filter order.

A **low-pass filter** passes frequencies below its cutoff region and attenuates higher frequencies. The rectangular-window method truncates the ideal impulse response to a finite length by multiplying it with a rectangular window:
\[
h[n]=h_{\mathrm{ideal}}[n]w_R[n]
\]
where the rectangular window is:
\[
w_R[n]=\begin{cases}1,&0\leq n\leq M\\0,&\text{otherwise}\end{cases}
\]
Windowing makes the filter finite-length; however, the rectangular window generally produces relatively high sidelobes in the frequency response.

### Given specifications
- Input frequencies: \(f_1=10\,\text{Hz}\), \(f_2=20\,\text{Hz}\), \(f_3=30\,\text{Hz}\).
- Sampling frequency: \(F_s=4f_{\max}=120\,\text{Hz}\).
- Passband edge: \(f_p=10\,\text{Hz}\).
- Stopband edge: \(f_s=1.4f_p=14\,\text{Hz}\).
- Window: rectangular.

The cutoff frequency is selected between the passband and stopband edges according to the design procedure. The filter is designed with `fir1()`; `freqz()` displays its frequency response.

## Algorithm
1. Generate three sinusoids at 10 Hz, 20 Hz, and 30 Hz and combine them into one signal.
2. Set the sampling frequency and filter edge specifications.
3. Calculate normalized transition width, cutoff frequency, filter length, and order according to the supplied MATLAB method.
4. Generate the rectangular window and design the FIR low-pass filter using `fir1()`.
5. Plot the filter magnitude response using `freqz()`.
6. Filter the composite input and compare the original and filtered FFT spectra.

## Conclusion
A low-pass FIR filter was designed using the rectangular-window method. Its frequency response and effect on the composite input signal were examined in MATLAB.
