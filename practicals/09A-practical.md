# Practical 09A — Design and Implementation of High-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a high-pass Finite Impulse Response (FIR) filter using a Hamming window in MATLAB and observe its frequency response and filtering effect.

## Apparatus
MATLAB

## Theory
An **FIR filter** has an impulse response of finite duration. Its output is calculated from the present and a fixed number of past input samples:

\[
y[n]=\sum_{k=0}^{M}b[k]x[n-k]
\]

where \(b[k]\) are the filter coefficients and \(M\) is the filter order.

A **high-pass filter** allows higher-frequency components to pass and attenuates lower-frequency components. The Hamming window is used to truncate the ideal filter response smoothly and reduce unwanted sidelobes.

The Hamming window of length \(L\) is:

\[
w_H[n]=0.54-0.46\cos\left(\frac{2\pi n}{L-1}\right),
\quad 0\leq n\leq L-1
\]

The filter is designed in MATLAB using `fir1()`. The cutoff frequency supplied to `fir1()` is normalized from 0 to 1, where 1 represents the Nyquist frequency \(F_s/2\).

## Given specifications

The input signal contains three sinusoidal components:

\[
f_1=10\,\text{Hz},\quad f_2=20\,\text{Hz},\quad f_3=30\,\text{Hz}
\]

The composite input is:

\[
x(t)=\sin(2\pi f_1t)+\sin(2\pi f_2t)+\sin(2\pi f_3t)
\]

Sampling frequency:

\[
F_s=4\times f_{\max}=4\times30=120\,\text{Hz}
\]

### High-pass filter design calculations

- Passband edge frequency: \(f_{pb}=30\,\text{Hz}\)
- Stopband edge frequency: \(f_{sb}=0.6f_{pb}=18\,\text{Hz}\)

Normalized transition width:

\[
\Delta f=\frac{f_{pb}-f_{sb}}{F_s}
=\frac{30-18}{120}=0.1
\]

Normalized passband and stopband edge frequencies:

\[
W_{pb}=\frac{2f_{pb}}{F_s}=0.5
\]

\[
W_{sb}=\frac{2f_{sb}}{F_s}=0.3
\]

Normalized cutoff frequency:

\[
W_c=\frac{W_{pb}+W_{sb}}{2}
=\frac{0.5+0.3}{2}=0.4
\]

This corresponds to a cutoff frequency of:

\[
f_c=W_c\frac{F_s}{2}=0.4\times60=24\,\text{Hz}
\]

Filter length and order:

\[
L=\left\lceil\frac{3.3}{\Delta f}\right\rceil
=\left\lceil33\right\rceil=33
\]

\[
M=L-1=32
\]

The passband starts at 30 Hz and the stopband ends at 18 Hz. Frequencies between 18 Hz and 30 Hz form the transition band.

## Algorithm
1. Clear the MATLAB workspace, command window, and figures.
2. Define the input frequencies as 10 Hz, 20 Hz, and 30 Hz.
3. Calculate the sampling frequency as four times the highest input frequency.
4. Generate the three sinusoidal signals and add them to obtain the composite input.
5. Set the high-pass filter specifications: passband edge 30 Hz and stopband edge 18 Hz.
6. Calculate the normalized transition width, normalized cutoff frequency, filter length, and filter order.
7. Generate a Hamming window and design the high-pass FIR filter using `fir1()`.
8. Plot the filter frequency response using `freqz()`.
9. Filter the composite signal using `filter()`.
10. Calculate and plot the single-sided FFT magnitude spectra of the original and filtered signals.

## Conclusion
A high-pass FIR filter was designed using a Hamming window in MATLAB. The filter attenuates the lower-frequency components and allows the higher-frequency component in the passband to pass. The frequency response and FFT spectra were plotted to observe the filtering effect.
