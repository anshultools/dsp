# Practical 05 — Frequency Component Detection Using DFT

## Aim
To generate a composite signal containing sine waves of different frequencies and identify its frequency components using the Discrete Fourier Transform (DFT).

## Apparatus
MATLAB

## Theory and Calculations

The **DFT** converts a discrete-time signal from the time domain into the frequency domain. It helps us identify the frequencies present in the signal.

Three sine waves are generated and added to form a composite signal:

$$
x(t)=\sin(2\pi f_1t)+\sin(2\pi f_2t)+\sin(2\pi f_3t)
$$

The given frequencies are:

- $f_1=10\,\text{Hz}$
- $f_2=50\,\text{Hz}$
- $f_3=100\,\text{Hz}$

The sampling frequency is selected as four times the highest frequency:

$$
F_s=4\times f_{\max}=4\times100=400\,\text{Hz}
$$

In MATLAB, the DFT is calculated using `fft()`, and the magnitude spectrum is obtained using `abs()`.

## Algorithm

1. Define the input frequencies as 10 Hz, 50 Hz, and 100 Hz.
2. Set the sampling frequency to $F_s=400\,\text{Hz}$.
3. Generate a one-second time vector and create the three sine waves.
4. Add the three sine waves to create the composite signal.
5. Set the DFT length to $N=128$ and calculate the DFT magnitude using `abs(fft(x,N))`.
6. Generate the frequency axis using $F=(F_s/N)k$, where $k=0,1,\ldots,N-1$.
7. Plot the composite signal and its DFT magnitude spectrum.
8. Identify the frequency peaks in the spectrum.

## Conclusion

The composite signal containing 10 Hz, 50 Hz, and 100 Hz components was generated. Its DFT was calculated using MATLAB's `fft()` function, and the frequency components were observed in the magnitude spectrum.
