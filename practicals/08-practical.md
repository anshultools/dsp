# Practical 08 — Low-Pass FIR Filter Using Rectangular Window

## Aim
To design and implement a low-pass Finite Impulse Response (FIR) filter using a rectangular window in MATLAB and observe its frequency response and filtering effect.

## Apparatus
MATLAB

## Theory

### 1. FIR low-pass filter
A **low-pass filter** allows low-frequency components to pass and reduces high-frequency components.

An FIR filter uses a fixed number of input samples to calculate its output. Its equation can be written in a simple form as:

$$
y[n]=b_0x[n]+b_1x[n-1]+\ldots+b_Mx[n-M]
$$

Here, $b_0,b_1,\ldots,b_M$ are the filter coefficients, and $M$ is the filter order.

### 2. Rectangular window
A rectangular window keeps the selected filter samples and removes the samples outside that range:

- $w_R[n]=1$ for sample numbers from 0 to $M$.
- $w_R[n]=0$ for all other sample numbers.

The rectangular window is simple to use, but it produces more ripples in the stopband than windows such as the Hamming window.

### 3. Given filter specifications
The input signal contains three sine waves:

- $f_1=10\,\text{Hz}$
- $f_2=20\,\text{Hz}$
- $f_3=30\,\text{Hz}$

The sampling frequency is four times the highest input frequency:

$$
F_s=4\times30=120\,\text{Hz}
$$

The passband edge is 10 Hz, and the stopband edge is 14 Hz.

The cutoff frequency is selected halfway between these two edges:

$$
f_c=\frac{10+14}{2}=12\,\text{Hz}
$$

The normalized cutoff frequency used by `fir1()` is:

$$
W_c=\frac{2f_c}{F_s}=\frac{2\times12}{120}=0.2
$$

The normalized transition width is:

$$
\Delta f=\frac{14-10}{120}=0.0333
$$

The filter length and order are:

$$
L=\left\lceil\frac{3.3}{0.0333}\right\rceil=99
$$

$$
M=L-1=98
$$

### 4. MATLAB functions used
- `fir1()` designs the FIR filter coefficients.
- `rectwin(L)` generates a rectangular window of length $L$.
- `freqz()` displays the filter's magnitude and phase responses.
- `filter()` applies the filter to the input signal.
- `fft()` calculates the frequency components of a signal.

## Algorithm
1. Clear the MATLAB workspace and close all figures.
2. Generate sine waves at 10 Hz, 20 Hz, and 30 Hz, and add them to form the input signal.
3. Set the sampling frequency to 120 Hz.
4. Set the passband edge to 10 Hz and the stopband edge to 14 Hz.
5. Calculate the cutoff frequency, transition width, filter length, and filter order.
6. Generate the rectangular window and design the low-pass FIR filter using `fir1()`.
7. Plot the frequency response using `freqz()`.
8. Apply the filter using `filter()`.
9. Compare the frequency spectra of the original and filtered signals using FFT plots.

## Conclusion
A low-pass FIR filter was designed using a rectangular window in MATLAB. The frequency response and the effect of the filter on the composite input signal were observed.
