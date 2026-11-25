# Practical 09 — Design and Implementation of Low-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a low-pass FIR filter using a Hamming window in MATLAB.

## Apparatus
MATLAB

## Theory and Calculations

A **low-pass FIR filter** allows low-frequency components to pass and attenuates high-frequency components.

The input signal is made by adding three sine waves:

$$
x(t)=\sin(2\pi10t)+\sin(2\pi20t)+\sin(2\pi30t)
$$

The sampling frequency is four times the highest input frequency:

$$
F_s=4\times30=120\,\text{Hz}
$$

### Hamming window

The Hamming window reduces unwanted ripples in the stopband compared with a rectangular window.

For a window of length $L$, the Hamming window is:

$$
w[n]=0.54-0.46\cos\left(\frac{2\pi n}{L-1}\right)
$$

Here, $n$ runs from 0 to $L-1$. MATLAB generates this window using `hamming(L)`.

### Filter specifications

- Passband edge frequency: $f_p=10\,\text{Hz}$.
- Stopband edge frequency: $f_{st}=14\,\text{Hz}$.

The normalized transition width is:

$$
\Delta f=\frac{14-10}{120}=0.0333
$$

The cutoff frequency is halfway between the two edge frequencies:

$$
f_c=\frac{10+14}{2}=12\,\text{Hz}
$$

The normalized cutoff frequency used by `fir1()` is:

$$
W_c=\frac{2f_c}{F_s}=\frac{2\times12}{120}=0.2
$$

The Hamming window length is:

$$
L=\left\lceil\frac{3.3}{0.0333}\right\rceil=99
$$

The filter order is:

$$
M=L-1=98
$$

Therefore, the filter has 99 coefficients and order 98.

### MATLAB functions used

- `hamming(L)` generates the Hamming window.
- `fir1(M,W_c,'low',window)` calculates the FIR filter coefficients.
- `freqz()` displays the filter's magnitude and phase responses.
- `filter()` applies the filter to the input signal.
- `fft()` calculates the frequency spectrum.

## Algorithm

1. Define input frequencies as 10 Hz, 20 Hz, and 30 Hz.
2. Set the sampling frequency to $F_s=120\,\text{Hz}$ and generate the composite signal.
3. Set the passband edge to 10 Hz and stopband edge to 14 Hz.
4. Calculate the normalized transition width and cutoff frequency.
5. Calculate the Hamming window length and filter order.
6. Generate the window using `hamming(L)` and design the low-pass FIR filter using `fir1()`.
7. Plot the frequency response using `freqz()`.
8. Apply the filter using `filter()`.
9. Calculate the FFT magnitudes of the original and filtered signals and plot them for comparison.

## Conclusion

The low-pass FIR filter was designed using a Hamming window in MATLAB. The 10 Hz component is in the passband and is intended to pass, while the 20 Hz and 30 Hz components are in the stopband and are attenuated. The Hamming window reduces stopband ripples compared with a rectangular window.
