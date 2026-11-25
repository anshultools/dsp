# Practical 09 — Low-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a low-pass FIR filter using a Hamming window in MATLAB and observe its frequency response and filtering effect.

## Apparatus
MATLAB

## Theory

### 1. Low-pass FIR filter
A **low-pass filter** allows low-frequency components to pass and reduces high-frequency components.

An FIR filter uses a fixed number of input samples to calculate its output:

$$
y[n]=b_0x[n]+b_1x[n-1]+\ldots+b_Mx[n-M]
$$

Here, $b_0,b_1,\ldots,b_M$ are the filter coefficients, and $M$ is the filter order.

### 2. Composite input signal
Three sine waves with frequencies of 10 Hz, 20 Hz, and 30 Hz are generated and added:

$$
x(t)=\sin(2\pi10t)+\sin(2\pi20t)+\sin(2\pi30t)
$$

The sampling frequency is four times the highest input frequency:

$$
F_s=4\times30=120\,\text{Hz}
$$

### 3. Hamming window
The Hamming window reduces unwanted ripples (sidelobes) in the filter's frequency response.

For a window of length $L$, its equation is:

$$
w[n]=0.54-0.46\cos\left(\frac{2\pi n}{L-1}\right)
$$

Here, $n$ runs from 0 to $L-1$. In MATLAB, `hamming(L)` generates the window.

### 4. Filter specifications and calculations
The passband edge is 10 Hz and the stopband edge is 14 Hz:

$$
f_p=10\,\text{Hz},\qquad f_{st}=14\,\text{Hz}
$$

The cutoff frequency is halfway between these values:

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

The Hamming window length and FIR filter order are:

$$
L=\left\lceil\frac{3.3}{0.0333}\right\rceil=99
$$

$$
M=L-1=98
$$

Thus, the filter has 99 coefficients and order 98.

### 5. MATLAB functions used
- `hamming(L)` creates the Hamming window.
- `fir1(M,W_c,'low',window)` calculates the FIR filter coefficients.
- `freqz()` plots the magnitude and phase responses.
- `filter()` applies the filter to the input signal.
- `fft()` calculates the frequency spectrum.

## Algorithm
1. Clear the MATLAB workspace and close all figures.
2. Generate sine waves at 10 Hz, 20 Hz, and 30 Hz and add them to form the composite input signal.
3. Set the sampling frequency to 120 Hz.
4. Set the passband edge to 10 Hz and stopband edge to 14 Hz.
5. Calculate the cutoff frequency, transition width, window length, and filter order.
6. Generate the Hamming window using `hamming(L)` and design the low-pass FIR filter using `fir1()`.
7. Plot the filter response using `freqz()`.
8. Apply the filter using `filter()`.
9. Plot and compare the frequency spectra of the original and filtered signals.

## Conclusion
A low-pass FIR filter was designed using a Hamming window in MATLAB. The 10 Hz component is in the passband and is intended to pass, while the 20 Hz and 30 Hz components are in the stopband and are attenuated.
