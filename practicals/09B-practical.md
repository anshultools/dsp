# Practical 09B — Design and Implementation of Band-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a band-pass Finite Impulse Response (FIR) filter using a Hamming window in MATLAB and observe its frequency response and filtering effect.

## Apparatus
MATLAB

## Theory
An **FIR filter** has an impulse response of finite duration. Its output is calculated from the present and a fixed number of past input samples:

\[
y[n]=\sum_{k=0}^{M}b[k]x[n-k]
\]

where \(b[k]\) are the filter coefficients and \(M\) is the filter order.

A **band-pass filter** allows frequencies within a selected range to pass and attenuates frequencies below and above that range. The Hamming window truncates the ideal filter response smoothly and helps reduce unwanted sidelobes.

The Hamming window of length \(L\) is:

\[
w_H[n]=0.54-0.46\cos\left(\frac{2\pi n}{L-1}\right),
\quad 0\leq n\leq L-1
\]

The filter is designed in MATLAB using `fir1()`. Its cutoff frequencies are normalized from 0 to 1, where 1 represents the Nyquist frequency \(F_s/2\).

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

### Band-pass filter design calculations

Passband edge frequencies:

\[
f_{pb1}=15\,\text{Hz},\qquad f_{pb2}=30\,\text{Hz}
\]

Stopband edge frequencies:

\[
f_{sb1}=10\,\text{Hz},\qquad f_{sb2}=35\,\text{Hz}
\]

Transition widths on the two sides:

\[
\Delta f_1=\frac{f_{pb1}-f_{sb1}}{F_s}
=\frac{15-10}{120}=0.04167
\]

\[
\Delta f_2=\frac{f_{sb2}-f_{pb2}}{F_s}
=\frac{35-30}{120}=0.04167
\]

The design uses the smaller transition width:

\[
\Delta f=\min(\Delta f_1,\Delta f_2)=0.04167
\]

Normalized passband and stopband edge frequencies:

\[
W_{pb1}=\frac{2f_{pb1}}{F_s}=0.25,
\qquad
W_{pb2}=\frac{2f_{pb2}}{F_s}=0.5
\]

\[
W_{sb1}=\frac{2f_{sb1}}{F_s}=0.1667,
\qquad
W_{sb2}=\frac{2f_{sb2}}{F_s}=0.5833
\]

The two normalized cutoff frequencies are the midpoints between the stopband and passband edges:

\[
W_{c1}=\frac{W_{pb1}+W_{sb1}}{2}
=\frac{0.25+0.1667}{2}\approx0.2083
\]

\[
W_{c2}=\frac{W_{pb2}+W_{sb2}}{2}
=\frac{0.5+0.5833}{2}\approx0.5417
\]

These correspond to approximately 12.5 Hz and 32.5 Hz.

Filter length and order:

\[
L=\left\lceil\frac{3.3}{\Delta f}\right\rceil
=\left\lceil79.2\right\rceil=80
\]

\[
M=L-1=79
\]

The passband is from 15 Hz to 30 Hz. The lower and upper stopbands are below 10 Hz and above 35 Hz, respectively. The regions from 10 Hz to 15 Hz and from 30 Hz to 35 Hz are transition bands.

## Algorithm
1. Clear the MATLAB workspace, command window, and figures.
2. Define the input frequencies as 10 Hz, 20 Hz, and 30 Hz.
3. Calculate the sampling frequency as four times the highest input frequency.
4. Generate the three sinusoidal signals and add them to obtain the composite input.
5. Set the lower and upper passband edges to 15 Hz and 30 Hz, and the stopband edges to 10 Hz and 35 Hz.
6. Calculate both transition widths and select the smaller one.
7. Calculate the normalized cutoff frequencies, filter length, and filter order.
8. Generate a Hamming window and design the band-pass FIR filter using `fir1()`.
9. Plot the filter frequency response using `freqz()`.
10. Filter the composite signal using `filter()`.
11. Calculate and plot the single-sided FFT magnitude spectra of the original and filtered signals.

## Conclusion
A band-pass FIR filter was designed using a Hamming window in MATLAB. The filter attenuates frequencies outside the selected passband and allows components within the passband to pass. The frequency response and FFT spectra were plotted to observe the filtering effect.
