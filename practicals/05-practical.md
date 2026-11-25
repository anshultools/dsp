# Practical 05 — Discrete Fourier Transform (DFT)

## Aim
To generate a composite sinusoidal signal and identify its frequency components using the Discrete Fourier Transform (DFT) in MATLAB.

## Apparatus
MATLAB

## Theory
The **Discrete Fourier Transform (DFT)** converts a finite set of time-domain samples into frequency-domain values. It helps identify the different frequencies present in a signal.

In MATLAB, the DFT is calculated using:

```matlab
X = fft(x, N);
```

The original time-domain signal can be recovered using the inverse DFT:

```matlab
x = ifft(X, N);
```

### Given values
- Input frequencies: 10 Hz, 50 Hz, and 100 Hz.
- Sampling frequency: $F_s=4\times100=400\,\text{Hz}$.
- DFT length: $N=128$ samples.

The three sine waves are added to form the composite signal:

$$
x[n]=x_1[n]+x_2[n]+x_3[n]
$$

The frequency spacing between adjacent DFT points is:

$$
\Delta f=\frac{F_s}{N}=\frac{400}{128}=3.125\,\text{Hz}
$$

## Algorithm
1. Define the three input frequencies and the sampling frequency.
2. Calculate the sampling interval using $T_s=1/F_s$.
3. Generate the three sine waves and add them to form the composite signal.
4. Plot the composite signal in the time domain.
5. Calculate the DFT using `fft(x,N)`.
6. Calculate the frequency axis using the sampling frequency and DFT length.
7. Plot the magnitude spectrum and observe the frequency components.

## Conclusion
A composite signal containing 10 Hz, 50 Hz, and 100 Hz components was generated. Its DFT magnitude spectrum was calculated and plotted in MATLAB.
