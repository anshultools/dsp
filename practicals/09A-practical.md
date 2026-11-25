# Practical 09A — High-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a high-pass FIR filter using a Hamming window in MATLAB and observe its frequency response and filtering effect.

## Apparatus
MATLAB software.

## Theory

### 1. High-pass FIR filter
A **high-pass filter** allows high-frequency components to pass and reduces low-frequency components.

An FIR filter uses a fixed number of input samples to calculate its output:

$$
y[n]=b_0x[n]+b_1x[n-1]+\ldots+b_Nx[n-N]
$$

Here, the $b$ values are the filter coefficients and $N$ is the filter order.

### 2. Composite input signal
Three sine waves at 10 Hz, 20 Hz, and 30 Hz are added to form the composite signal:

$$
x(t)=\sin(2\pi10t)+\sin(2\pi20t)+\sin(2\pi30t)
$$

The sampling frequency is four times the highest input frequency:

$$
F_s=4\times30=120\,\text{Hz}
$$

### 3. Hamming window
The Hamming window reduces unwanted ripples in the filter response. For a window of length $N+1$, it is:

$$
w[n]=0.54-0.46\cos\left(\frac{2\pi n}{N}\right)
$$

Here, $n$ runs from 0 to $N$. MATLAB generates it using `hamming(N+1)`.

### 4. High-pass filter specifications
The stopband edge is 10 Hz and the passband edge is 20 Hz:

$$
f_{sb}=10\,\text{Hz},\qquad f_{pb}=20\,\text{Hz}
$$

Frequencies below 10 Hz are attenuated. Frequencies above 20 Hz are passed. The range from 10 Hz to 20 Hz is the transition band.

The normalized transition width is:

$$
\Delta f=\frac{20-10}{120}=0.0833
$$

The normalized cutoff frequency is:

$$
W_c=\frac{2}{120}\times\frac{10+20}{2}=0.25
$$

This gives a cutoff frequency of:

$$
f_c=0.25\times\frac{120}{2}=15\,\text{Hz}
$$

### 5. Filter order and window length
The filter order is calculated as:

$$
N=\operatorname{round}\left(\frac{3.3}{0.0833}\right)=40
$$

The Hamming window length is one more than the filter order:

$$
L=N+1=41\,\text{samples}
$$

Therefore, the filter has 41 coefficients and order 40.

### 6. MATLAB functions used
- `hamming(N+1)` generates the Hamming window.
- `fir1(N,W_c,'high',window)` calculates the high-pass FIR filter coefficients.
- `freqz(b,1)` plots the magnitude and phase responses.
- `filter(b,1,x)` applies the filter to the input signal.
- `fft()` calculates the frequency spectrum.

## Algorithm
1. Clear the MATLAB workspace and close all figures.
2. Generate sine waves at 10 Hz, 20 Hz, and 30 Hz and add them to form the composite input signal.
3. Set the sampling frequency to 120 Hz.
4. Set the stopband edge to 10 Hz and passband edge to 20 Hz.
5. Calculate the transition width, cutoff frequency, filter order, and window length.
6. Generate the Hamming window using `hamming(N+1)` and design the high-pass FIR filter using `fir1()`.
7. Plot the magnitude and phase responses using `freqz()`.
8. Apply the filter using `filter()`.
9. Calculate and compare the FFT spectra of the original and filtered signals.

## Conclusion
A high-pass FIR filter was designed using a Hamming window in MATLAB. The 10 Hz component is at the stopband edge and is attenuated, while the 20 Hz and 30 Hz components are at or above the passband edge and are passed by the filter.
