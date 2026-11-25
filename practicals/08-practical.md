# Practical 08 — Design of Low-Pass FIR Filter Using Rectangular Window

## Aim
To design and implement a low-pass FIR filter using a rectangular window in MATLAB.

## Apparatus
MATLAB

## Theory and Calculations

A **low-pass FIR filter** allows low-frequency components to pass and attenuates high-frequency components.

A rectangular window keeps a fixed number of filter samples and makes the filter finite in length. It is simple to use, but it produces more ripples in the frequency response than a Hamming window.

### Input signal

The input is a composite signal made by adding sine waves at 10 Hz, 20 Hz, and 30 Hz.

The sampling frequency is four times the highest input frequency:

$$
F_s=4\times30=120\,\text{Hz}
$$

### Filter specifications

- Passband edge frequency: $f_p=10\,\text{Hz}$.
- Stopband edge frequency: $f_{st}=14\,\text{Hz}$.

The normalized transition width is:

$$
\Delta f=\frac{14-10}{120}=0.0333
$$

The cutoff frequency is the midpoint between the passband and stopband edges:

$$
f_c=\frac{10+14}{2}=12\,\text{Hz}
$$

The normalized cutoff frequency used by `fir1()` is:

$$
W_c=\frac{2f_c}{F_s}=\frac{2\times12}{120}=0.2
$$

For the rectangular window used in the MATLAB script, the approximate window length is:

$$
L=\left\lceil\frac{0.9}{0.0333}\right\rceil=27
$$

The filter order is one less than the window length:

$$
M=L-1=26
$$

### MATLAB functions used

- `rectwin(L)` generates the rectangular window.
- `fir1()` calculates the FIR filter coefficients.
- `freqz()` displays the magnitude and phase responses.
- `filter()` applies the filter to the input signal.
- `fft()` calculates the frequency spectrum.

## Algorithm

1. Define the input frequencies as 10 Hz, 20 Hz, and 30 Hz.
2. Set the sampling frequency to $F_s=120\,\text{Hz}$.
3. Generate a one-second composite signal by adding the three sine waves.
4. Set the passband edge to 10 Hz and the stopband edge to 14 Hz.
5. Calculate the normalized transition width, cutoff frequency, window length, and filter order.
6. Generate the rectangular window using `rectwin(L)`.
7. Design the low-pass FIR filter using `fir1()`.
8. Display the filter response using `freqz()`.
9. Apply the filter using `filter()`.
10. Calculate the FFT magnitude of the original and filtered signals and plot them for comparison.

## Conclusion

The low-pass FIR filter was designed and implemented using a rectangular window in MATLAB. The frequency spectra were compared to observe the passing of the 10 Hz component and attenuation of the higher-frequency components.
