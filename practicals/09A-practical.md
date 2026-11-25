# Practical 09A — Design and Implementation of High-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a high-pass FIR filter using a Hamming window in MATLAB.

## Apparatus
MATLAB software.

## Theory and Calculations

A **high-pass FIR filter** allows high-frequency components to pass and attenuates low-frequency components.

The input signal is made by adding sine waves at 10 Hz, 20 Hz, and 30 Hz. The sampling frequency is:

$$
F_s=4\times30=120\,\text{Hz}
$$

### Hamming window

The Hamming window reduces unwanted ripples in the filter response. For a filter order of $N$, its length is $N+1$ samples:

$$
w[n]=0.54-0.46\cos\left(\frac{2\pi n}{N}\right)
$$

Here, $n$ runs from 0 to $N$. MATLAB generates the window using `hamming(N+1)`.

### High-pass filter specifications

- Stopband edge frequency: $f_{sb}=10\,\text{Hz}$.
- Passband edge frequency: $f_{pb}=20\,\text{Hz}$.

Frequencies below 10 Hz are attenuated. Frequencies above 20 Hz are passed. The range from 10 Hz to 20 Hz is the transition band.

The normalized transition width is:

$$
\Delta f=\frac{20-10}{120}=0.0833
$$

The normalized cutoff frequency is:

$$
W_c=\frac{2}{120}\times\frac{10+20}{2}=0.25
$$

The actual cutoff frequency is:

$$
f_c=0.25\times\frac{120}{2}=15\,\text{Hz}
$$

### Filter order and window length

The filter order is:

$$
N=\operatorname{round}\left(\frac{3.3}{0.0833}\right)=40
$$

The window length is:

$$
L=N+1=41\,\text{samples}
$$

Therefore, the filter has 41 coefficients and order 40.

### MATLAB functions used

- `hamming(N+1)` generates the Hamming window.
- `fir1(N,W_c,'high',window)` calculates the high-pass FIR filter coefficients.
- `freqz(b,1)` displays the magnitude and phase responses.
- `filter(b,1,x)` applies the filter to the input signal.
- `fft()` calculates the frequency spectrum.

## Algorithm

1. Generate the composite input signal using 10 Hz, 20 Hz, and 30 Hz sine waves.
2. Set the sampling frequency to 120 Hz.
3. Set the stopband edge to 10 Hz and the passband edge to 20 Hz.
4. Calculate the normalized transition width and cutoff frequency.
5. Calculate the filter order and window length.
6. Generate the Hamming window using `hamming(N+1)`.
7. Design the high-pass FIR filter using `fir1(N,W_c,'high',window)`.
8. Plot the magnitude and phase responses using `freqz()`.
9. Apply the filter using `filter()`.
10. Calculate and compare the FFT spectra of the original and filtered signals.

## Conclusion

The high-pass FIR filter was designed using a Hamming window in MATLAB. The 10 Hz component is at the stopband edge and is attenuated. The 20 Hz component is at the passband edge, and the 30 Hz component is inside the passband. The FFT plots show the effect of the filter on the input signal.
