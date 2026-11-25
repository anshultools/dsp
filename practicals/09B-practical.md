# Practical 09B — Design and Implementation of Band-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a band-pass FIR filter using a Hamming window in MATLAB.

## Apparatus
MATLAB

## Theory and Calculations

A **band-pass FIR filter** allows frequencies within a selected range to pass and attenuates frequencies below and above that range.

The input signal is made by adding sine waves at 10 Hz, 20 Hz, and 30 Hz. The sampling frequency is:

$$
F_s=4\times30=120\,\text{Hz}
$$

### Hamming window

The Hamming window reduces unwanted ripples in the filter response. For a window of length $L$:

$$
w[n]=0.54-0.46\cos\left(\frac{2\pi n}{L-1}\right)
$$

Here, $n$ runs from 0 to $L-1$. MATLAB generates this window using `hamming(L)`.

### Band-pass filter specifications

- Lower passband edge: $f_{pb1}=15\,\text{Hz}$.
- Upper passband edge: $f_{pb2}=30\,\text{Hz}$.
- Lower stopband edge: $f_{sb1}=10\,\text{Hz}$.
- Upper stopband edge: $f_{sb2}=35\,\text{Hz}$.

Both transition bands are 5 Hz wide. The normalized transition width is:

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

### Filter order and window length

The Hamming window length is:

$$
L=\left\lceil\frac{3.3}{0.0417}\right\rceil=80
$$

The filter order is one less than the window length:

$$
M=L-1=79
$$

Therefore, the filter has 80 coefficients and order 79.

### MATLAB functions used

- `hamming(L)` generates the Hamming window.
- `fir1(M,[W_c1 W_c2],'bandpass',window)` calculates the band-pass FIR filter coefficients.
- `freqz()` displays the magnitude and phase responses.
- `filter()` applies the filter to the input signal.
- `fft()` calculates the frequency spectrum.

## Algorithm

1. Generate the composite input signal using 10 Hz, 20 Hz, and 30 Hz sine waves.
2. Set the sampling frequency to 120 Hz.
3. Set the passband from 15 Hz to 30 Hz and stopband edges at 10 Hz and 35 Hz.
4. Calculate the two transition widths and select the smaller width.
5. Calculate the lower and upper cutoff frequencies.
6. Calculate the filter length and order.
7. Generate the Hamming window and design the band-pass FIR filter using `fir1()`.
8. Plot the magnitude and phase responses using `freqz()`.
9. Apply the filter using `filter()`.
10. Calculate and compare the FFT spectra of the original and filtered signals.

## Conclusion

The band-pass FIR filter was designed using a Hamming window in MATLAB. The filter allows components within the 15 Hz to 30 Hz passband to pass and attenuates components outside this range.
