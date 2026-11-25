# Practical 09A — Design and Implementation of High-Pass FIR Filter Using Hamming Window

## Aim
To design and implement a high-pass Finite Impulse Response (FIR) filter using a Hamming window in MATLAB, and to observe its frequency response and filtering effect.

## Apparatus
MATLAB software.

## Theory

### 1. High-pass FIR filter
A **high-pass filter** allows high-frequency components to pass while reducing low-frequency components.

An **FIR filter** has a finite-duration impulse response. Its output is calculated using the present input sample and a fixed number of previous input samples:

\[
y[n]=\sum_{k=0}^{N}b[k]x[n-k]
\]

Here, \(x[n]\) is the input sequence, \(y[n]\) is the filtered output, \(b[k]\) are the filter coefficients, and \(N\) is the filter order.

### 2. Generation of the input signal
Three sine waves are generated with frequencies of 10 Hz, 20 Hz, and 30 Hz:

\[
x_1(t)=\sin(2\pi f_1t),\qquad
x_2(t)=\sin(2\pi f_2t),\qquad
x_3(t)=\sin(2\pi f_3t)
\]

These signals are added to form the composite input:

\[
x(t)=x_1(t)+x_2(t)+x_3(t)
\]

The highest input frequency is 30 Hz. The sampling frequency is chosen as four times this value:

\[
F_s=4f_{\max}=4\times30=120\,\text{Hz}
\]

The sampling interval is \(T_s=1/F_s=1/120\) seconds. A one-second record contains 120 samples, with the time vector running from 0 to \(1-T_s\).

### 3. Hamming window
A window is applied to the ideal filter response to obtain a finite number of filter coefficients. The **Hamming window** reduces sidelobes (unwanted ripples) in the frequency response compared with a rectangular window.

For a filter order of \(N\), the Hamming window contains \(N+1\) samples:

\[
w[n]=0.54-0.46\cos\left(\frac{2\pi n}{N}\right),
\quad 0\leq n\leq N
\]

In MATLAB, `hamming(N+1)` generates this window.

### 4. High-pass filter specifications
The stopband edge is set to 10 Hz, and the passband edge is set to 20 Hz:

\[
f_{sb}=10\,\text{Hz},\qquad f_{pb}=20\,\text{Hz}
\]

Frequencies below 10 Hz are in the stopband and are attenuated. Frequencies above 20 Hz are in the passband and are allowed to pass. The region from 10 Hz to 20 Hz is the **transition band**.

The normalized transition width is:

\[
\Delta f=\frac{f_{pb}-f_{sb}}{F_s}
=\frac{20-10}{120}=0.0833
\]

The normalized passband and stopband edge frequencies are:

\[
W_{pb}=\frac{2f_{pb}}{F_s}
=\frac{2\times20}{120}=0.3333
\]

\[
W_{sb}=\frac{2f_{sb}}{F_s}
=\frac{2\times10}{120}=0.1667
\]

The normalized cutoff frequency is selected as the midpoint:

\[
W_c=\frac{W_{pb}+W_{sb}}{2}
=\frac{0.3333+0.1667}{2}=0.25
\]

For MATLAB's `fir1()`, a normalized frequency of 1 represents the Nyquist frequency \(F_s/2\). Therefore, the cutoff frequency in hertz is:

\[
f_c=W_c\frac{F_s}{2}
=0.25\times60=15\,\text{Hz}
\]

### 5. Filter order and window length
The approximate Hamming-window filter order is calculated as:

\[
N=\operatorname{round}\left(\frac{3.3}{\Delta f}\right)
=\operatorname{round}\left(\frac{3.3}{0.0833}\right)=40
\]

The Hamming window length is one more than the filter order:

\[
L=N+1=41\,\text{samples}
\]

Therefore, the FIR filter has 41 coefficients and order 40.

### 6. MATLAB functions used
- `hamming(N+1)` generates the Hamming window with 41 samples.
- `fir1(N,W_c,'high',window)` calculates the high-pass FIR filter coefficients.
- `freqz(b,1)` displays the magnitude and phase frequency responses.
- `filter(b,1,x)` applies the filter to the composite input signal.
- `fft()` calculates the frequency components of the original and filtered signals.
- `abs()` calculates the magnitude of the FFT values.

## Algorithm
1. Clear the MATLAB command window and workspace, and close all open figures using `clc`, `clear`, and `close all`.
2. Define the input frequencies as 10 Hz, 20 Hz, and 30 Hz.
3. Calculate the sampling frequency as \(F_s=120\,\text{Hz}\) and create a one-second time vector using the sampling interval \(T_s=1/F_s\).
4. Generate the three sine waves and add them to form the composite signal \(x(t)\).
5. Set the stopband edge frequency to \(f_{sb}=10\,\text{Hz}\) and the passband edge frequency to \(f_{pb}=20\,\text{Hz}\).
6. Calculate the normalized transition width, normalized cutoff frequency, and filter order \(N=\operatorname{round}(3.3/\Delta f)\).
7. Generate the Hamming window using `hamming(N+1)` and design the high-pass FIR filter using `fir1(N,W_c,'high',window)`.
8. Plot the magnitude and phase responses of the filter using `freqz(b,1)`.
9. Apply the filter to the composite signal using `filter(b,1,x)`.
10. Calculate the FFT magnitudes of the original and filtered signals. Plot their frequency spectra against the frequency axis and compare the results.

## Conclusion
The high-pass FIR filter was designed and implemented using a Hamming window in MATLAB. The 10 Hz component lies in the stopband and is attenuated, while the 20 Hz and 30 Hz components lie at or above the passband edge and are allowed to pass. The magnitude and phase responses, along with the FFT spectra of the input and filtered signals, are used to observe the filtering effect.
