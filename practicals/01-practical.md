# Practical 01 — Verification of Sampling Theorem

## Write-Up

**Aim:** To verify the Sampling Theorem using MATLAB.

**Apparatus:** MATLAB

## Theory and Derivation

The Sampling Theorem states that a continuous-time band-limited signal can be represented by its samples and reconstructed without distortion if the sampling frequency \(F_s\) is at least twice the highest frequency component \(F_{\max}\):

\[
F_s \geq 2F_{\max}
\]

In practice, a sampling frequency greater than the Nyquist rate is preferred for reconstruction using real filters.

### Signal equations

Continuous-time sinusoid:

\[
x(t)=A\cos(2\pi ft)
\]

Sampled signal, at \(t=n/F_s\):

\[
x[n]=A\cos\left(2\pi f\frac{n}{F_s}\right)
\]

### Part 1 — Under-sampling (\(F_1=10\) Hz, \(F_2=50\) Hz, \(F_s=40\) Hz)

For the 50 Hz signal, \(2F_2=100\) Hz is greater than the sampling frequency of 40 Hz, so the Nyquist criterion is not met and aliasing occurs.

For \(F_1=10\) Hz:

\[
x_1[n]=A\cos\left(2\pi\frac{10}{40}n\right)
=A\cos\left(\frac{\pi}{2}n\right)
\]

For \(F_2=50\) Hz:

\[
\begin{aligned}
x_2[n]&=A\cos\left(2\pi\frac{50}{40}n\right)\\
&=A\cos\left(\frac{5\pi}{2}n\right)\\
&=A\cos\left(2\pi n+\frac{\pi}{2}n\right)\\
&=A\cos\left(\frac{\pi}{2}n\right)
\end{aligned}
\]

Therefore, the two sampled signals are identical: the 50 Hz signal aliases to 10 Hz at this sampling rate.

### Part 2 — Nyquist-rate sampling (\(F_s=100\) Hz)

Normalized frequencies are:

\[
\frac{F_1}{F_s}=\frac{10}{100}=0.1
\]

\[
\frac{F_2}{F_s}=\frac{50}{100}=0.5
\]

At 100 Hz, the 50 Hz signal is sampled at the Nyquist limit, and its samples are distinguishable from those of the 10 Hz signal.

## Algorithm

1. Clear the command window, workspace, and previous figures using `clc`, `clear`, and `close all`.
2. Set amplitude \(A=1\), frequencies \(f_1=10\) Hz and \(f_2=50\) Hz, and initially set \(F_s=40\) Hz.
3. Generate the continuous-time vector `t = 0:0.001:1`, calculate both continuous signals, and plot them.
4. Generate sample instants `n = 0:1/Fs:1`, calculate both discrete signals, and compare the sample points with the continuous waveforms.
5. Repeat the sampling comparison with \(F_s=100\) Hz.
6. Stop.

## Conclusion

At \(F_s=40\) Hz, aliasing occurs: the 10 Hz and 50 Hz sinusoids produce identical samples. At \(F_s=100\) Hz, the sampling rate reaches the Nyquist limit for the 50 Hz signal. For practical reconstruction with real filters, a sampling frequency greater than twice the maximum signal frequency is preferred.
