# Practical 01 — Verification of Sampling Theorem

## Write-Up

**Aim:** To verify the sampling theorem using MATLAB for two sinusoidal signals.

**Theory:** The sampling theorem states that a continuous-time signal can be reconstructed from its samples when the sampling frequency is at least twice the highest frequency present in the signal. This minimum is called the Nyquist rate. Sampling below this rate can cause aliasing.

**Given:** Amplitude 5; signal frequencies 10 Hz and 50 Hz; sampling frequency 40 Hz. The 10 Hz signal is sampled above its Nyquist rate (20 Hz), while the 50 Hz signal is sampled below its Nyquist rate (100 Hz), demonstrating aliasing.

**Procedure:** Define signal values and time vectors; generate continuous and sampled versions; plot all four signals for comparison.

**Conclusion:** Sampling behavior for 10 Hz and 50 Hz signals at 40 Hz was demonstrated in MATLAB.