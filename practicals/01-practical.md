# Practical 01 — Verification of Sampling Theorem

## Aim
To verify the Sampling Theorem using MATLAB.

## Apparatus
MATLAB software.

## Theory
The **Sampling Theorem** states that a band-limited signal can be reconstructed from its samples if the sampling frequency is at least twice its highest frequency component.

\[
F_s\geq 2F_{\max}
\]

where \(F_s\) is the sampling frequency and \(F_{\max}\) is the highest frequency present in the signal. The minimum value \(2F_{\max}\) is called the **Nyquist rate**. In practical reconstruction, a sampling frequency above the Nyquist rate is usually preferred.

### Signal used
A sinusoidal signal is:

\[
x(t)=A\cos(2\pi ft)
\]

Sampling at \(F_s\) gives sample times \(t=n/F_s\), and the sampled sequence is:

\[
x[n]=A\cos\left(\frac{2\pi fn}{F_s}\right)
\]

Here, \(A\) is amplitude, \(f\) is signal frequency in hertz, and \(n\) is an integer sample index.

## Part 1 — Under-sampling (\(F_s=40\,\text{Hz}\))
Use two signals with frequencies \(f_1=10\,\text{Hz}\) and \(f_2=50\,\text{Hz}\), sampled at \(F_s=40\,\text{Hz}\).

For the 10 Hz signal:
\[
x_1[n]=A\cos\left(\frac{2\pi(10)n}{40}\right)
=A\cos\left(\frac{\pi n}{2}\right)
\]

For the 50 Hz signal:
\[
\begin{aligned}
x_2[n]&=A\cos\left(\frac{2\pi(50)n}{40}\right)\\
&=A\cos\left(\frac{5\pi n}{2}\right)\\
&=A\cos\left(2\pi n+\frac{\pi n}{2}\right)\\
&=A\cos\left(\frac{\pi n}{2}\right)
\end{aligned}
\]

Thus, the two signals produce identical samples at \(F_s=40\,\text{Hz}\). The 50 Hz signal appears as a 10 Hz signal in the sampled data. This is **aliasing**.

## Part 2 — Sampling at the Nyquist rate (\(F_s=100\,\text{Hz}\))
For the highest signal frequency, 50 Hz:

\[
F_s=2F_{\max}=2(50)=100\,\text{Hz}
\]

At this rate, the normalized frequencies are \(10/100=0.1\) and \(50/100=0.5\) cycles per sample. The sample patterns are distinguishable; the 50 Hz signal is sampled exactly at the Nyquist limit.

## Algorithm
1. Clear the command window, workspace, and figures.
2. Set amplitude \(A=1\), signal frequencies \(f_1=10\,\text{Hz}\) and \(f_2=50\,\text{Hz}\).
3. Set \(F_s=40\,\text{Hz}\); generate and plot both continuous-time signals.
4. Sample both signals at 40 Hz and plot sample points over the continuous curves.
5. Change \(F_s\) to 100 Hz and repeat the comparison.
6. Observe the samples and stop.

## Conclusion
At 40 Hz, the 10 Hz and 50 Hz signals produce identical sample values, demonstrating aliasing. At 100 Hz, the sampling frequency equals the Nyquist rate for a 50 Hz signal. Sampling above the Nyquist rate is generally preferred for practical reconstruction.
