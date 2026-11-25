# Practical 05 — Discrete Fourier Transform (DFT)

## Aim
To generate a composite sinusoidal signal and identify its frequency components using the Discrete Fourier Transform (DFT) in MATLAB.

## Apparatus
MATLAB

## Theory
The **Discrete Fourier Transform (DFT)** converts a finite sequence of time-domain samples into frequency-domain values. It helps identify the frequency components present in a sampled signal.

For a sequence of \(N\) samples, the DFT is:
\[
X[k]=\sum_{n=0}^{N-1}x[n]e^{-j2\pi kn/N},\qquad k=0,1,\ldots,N-1
\]
The inverse DFT is:
\[
x[n]=\frac{1}{N}\sum_{k=0}^{N-1}X[k]e^{j2\pi kn/N}
\]
MATLAB's `fft()` calculates the DFT efficiently.

### Given
- Sinusoidal frequencies: \(f_1=10\,\text{Hz}\), \(f_2=50\,\text{Hz}\), and \(f_3=100\,\text{Hz}\).
- Sampling frequency: \(F_s=4f_{\max}=400\,\text{Hz}\).
- DFT length: \(N=128\) samples.

The three sinusoidal signals and their sum can be represented as:
\[
\begin{aligned}
x_1[n]&=\sin\left(\frac{2\pi f_1n}{F_s}\right)\\
x_2[n]&=\sin\left(\frac{2\pi f_2n}{F_s}\right)\\
x_3[n]&=\sin\left(\frac{2\pi f_3n}{F_s}\right)\\
x[n]&=x_1[n]+x_2[n]+x_3[n]
\end{aligned}
\]

The frequency-bin spacing is \(\Delta f=F_s/N\). The FFT magnitude \(|X[k]|\) is plotted against the frequency-bin axis to examine the components.

## Algorithm
1. Define the three frequencies and sampling frequency.
2. Calculate the sampling interval \(T_s=1/F_s\) and time/sample vector.
3. Generate the sinusoidal sequences and add them to form \(x[n]\).
4. Plot the composite time-domain waveform.
5. Compute the DFT using `fft(x,N)`.
6. Calculate the frequency axis using the sample rate and DFT length.
7. Plot the FFT magnitude spectrum and identify the frequency components.

## Conclusion
A composite signal containing 10 Hz, 50 Hz, and 100 Hz components was generated. Its DFT magnitude spectrum was plotted in MATLAB to examine the constituent frequencies.
