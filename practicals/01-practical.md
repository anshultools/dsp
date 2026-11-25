# Practical 01 — Verification of Sampling Theorem

## Write-Up

**Aim:** To verify the sampling theorem using MATLAB for two sinusoidal signals.

**Theory:** The sampling theorem states that a continuous-time signal can be reconstructed from its samples when the sampling frequency is at least twice the highest frequency present in the signal. This minimum sampling frequency is called the Nyquist rate. If the sampling frequency is too low, aliasing may occur.

**Given:**
- Amplitude: 5
- Signal frequencies: 10 Hz and 50 Hz
- Sampling frequency: 40 Hz

The 10 Hz signal is sampled above its Nyquist rate (20 Hz), while the 50 Hz signal is sampled below its Nyquist rate (100 Hz), so aliasing is demonstrated for the higher-frequency signal.

**Procedure:**
1. Define signal amplitude, frequencies, and sampling frequency.
2. Generate continuous-time signals using a fine time step.
3. Generate sampled signals at the selected sampling frequency.
4. Plot continuous and sampled signals for comparison.

**Conclusion:** The sampling theorem was demonstrated in MATLAB by comparing continuous and discrete samples of 10 Hz and 50 Hz signals at a sampling frequency of 40 Hz.
