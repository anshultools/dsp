# Practical 01 — Verification of Sampling Theorem

## Aim
To verify the Sampling Theorem using MATLAB.

## Apparatus
MATLAB software.

## Theory

The **Sampling Theorem** says that a continuous signal can be represented by its samples when the sampling frequency is at least twice the highest frequency present in the signal.

**Sampling frequency (Fs):** how many samples are taken per second (Hz).  
**Highest signal frequency (Fmax):** the highest frequency component in the signal.

The condition is:

**Fs ≥ 2 × Fmax**

The minimum sampling frequency, **2 × Fmax**, is called the **Nyquist rate**. In practical signal reconstruction, sampling a little faster than the Nyquist rate is usually preferred.

### Signal used

A sine wave is:

**x(t) = A cos(2πft)**

where:
- **A** = amplitude of the signal
- **f** = signal frequency in Hz
- **t** = time in seconds

When we sample it at frequency **Fs**, the sample times are **t = n/Fs**, where **n = 0, 1, 2, 3, ...**. The sampled signal becomes:

**x[n] = A cos(2πfn/Fs)**

## Part 1 — Under-sampling (Fs = 40 Hz)

We use two signals:
- Signal 1: f1 = 10 Hz
- Signal 2: f2 = 50 Hz
- Sampling frequency: Fs = 40 Hz

For the 10 Hz signal:

**x1[n] = A cos(2π × 10 × n/40)**  
**x1[n] = A cos(πn/2)**

For the 50 Hz signal:

**x2[n] = A cos(2π × 50 × n/40)**  
**x2[n] = A cos(5πn/2)**

Since cosine repeats every 2π, the term 2πn does not change the sample values. Therefore:

**x2[n] = A cos(πn/2)**

So, **both signals have the same sample values** when sampled at 40 Hz. The 50 Hz signal appears like a 10 Hz signal after sampling. This effect is called **aliasing**.

## Part 2 — Sampling at the Nyquist rate (Fs = 100 Hz)

For the highest signal frequency (50 Hz), the Nyquist rate is:

**Fs = 2 × 50 = 100 Hz**

At this sampling rate:
- 10 Hz signal: 10/100 = 0.1 cycles per sample
- 50 Hz signal: 50/100 = 0.5 cycles per sample

The sampled signals can now be distinguished. The 50 Hz signal is sampled exactly at the Nyquist limit.

## Algorithm

1. Clear the command window, workspace, and figures.
2. Set amplitude A = 1, signal frequencies f1 = 10 Hz and f2 = 50 Hz.
3. Set the sampling frequency Fs = 40 Hz.
4. Generate the continuous-time signals and plot them.
5. Sample both signals at Fs = 40 Hz and plot the sample points over the continuous signals.
6. Change the sampling frequency to Fs = 100 Hz and repeat the comparison.
7. Observe the sample points and stop.

## Conclusion

At a sampling frequency of 40 Hz, the 10 Hz and 50 Hz signals produce the same sample values, so aliasing occurs. At 100 Hz, the sampling frequency equals twice the highest signal frequency (50 Hz), which is the Nyquist rate. In practice, a sampling frequency higher than the Nyquist rate is preferred for accurate reconstruction.
