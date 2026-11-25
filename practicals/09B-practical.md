# Practical 09B — Band-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a band-pass FIR filter using a Hamming window in MATLAB and observe its frequency response and filtering effect.

## Apparatus
MATLAB

## Theory

### 1. Band-pass FIR filter
A **band-pass filter** allows frequencies within a selected range to pass and reduces frequencies below and above that range.

An FIR filter uses a fixed number of input samples to calculate its output:

$$
y[n]=b_0x[n]+b_1x[n-1]+\ldots+b_Mx[n-M]
$$

Here, the $b$ values are the filter coefficients and $M$ is the filter order.

### 2. Composite input signal
Three sine waves at 10 Hz, 20 Hz, and 30 Hz are added to form the composite signal:

$$
x(t)=\sin(2\pi10t)+\sin(2\pi20t)+\sin(2\pi30t)
$$

The sampling frequency is:

$$
F_s=4\times30=120\,\text{Hz}
$$

### 3. Hamming window
The Hamming window reduces unwanted ripples in the filter response. For a window of length $L$, it is:

$$
w[n]=0.54-0.46\cos\left(\frac{2\pi n}{L-1}\right)
$$

Here, $n$ runs from 0 to $L-1$. MATLAB generates it using `hamming(L)`.

### 4. Band-pass filter specifications
The passband is from 15 Hz to 30 Hz:

- Lower passband edge: 15 Hz.
- Upper passband edge: 30 Hz.
- Lower stopband edge: 10 Hz.
- Upper stopband edge: 35 Hz.

The two transition bands are each 5 Hz wide. The normalized transition width is:

$$
\Delta f=\frac{5}{120}=0.0417
$$

The lower cutoff frequency is halfway between 10 Hz and 15 Hz:

$$
f_{c1}=\frac{10+15}{2}=12.5\,\text{Hz}
$$

The upper cutoff frequency is halfway between 30 Hz and 35 Hz:

$$
f_{c2}=\frac{30+35}{2}=32.5\,\text{Hz}
$$

The normalized cutoff frequencies used by `fir1()` are:

$$
W_{c1}=\frac{2\times12.5}{120}=0.2083
$$

$$
W_{c2}=\frac{2\times32.5}{120}=0.5417
$$

### 5. Filter order and window length
The Hamming window length is:

$$
L=\left\lceil\frac{3.3}{0.0417}\right\rceil=80
$$

The filter order is one less than the window length:

$$
M=L-1=79
$$

Therefore, the filter has 80 coefficients and order 79.

### 6. MATLAB functions used
- `hamming(L)` generates the Hamming window.
- `fir1(M,[W_c1 W_c2],'bandpass',window)` calculates the band-pass FIR filter coefficients.
- `freqz()` plots the magnitude and phase responses.
- `filter()` applies the filter to the input signal.
- `fft()` calculates the frequency spectrum.

## Algorithm
1. Clear the MATLAB workspace and close all figures.
2. Generate sine waves at 10 Hz, 20 Hz, and 30 Hz and add them to form the composite input signal.
3. Set the sampling frequency to 120 Hz.
4. Set the passband from 15 Hz to 30 Hz, and stopband edges at 10 Hz and 35 Hz.
5. Calculate the transition width, two cutoff frequencies, filter order, and window length.
6. Generate the Hamming window and design the band-pass FIR filter using `fir1()`.
7. Plot the magnitude and phase responses using `freqz()`.
8. Apply the filter using `filter()`.
9. Calculate and compare the FFT spectra of the original and filtered signals.

## Conclusion
A band-pass FIR filter was designed using a Hamming window in MATLAB. The filter allows frequency components within the 15 Hz to 30 Hz passband to pass and reduces components outside this range.
