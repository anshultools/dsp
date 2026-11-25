# Practical 07 — Pole-Zero Plot and Frequency Response

## Write-Up

**Aim:** To plot the pole-zero diagram and frequency response of a discrete-time system using MATLAB.

**Theory:** A discrete-time system can be represented by its transfer function (H(z)). Poles are the roots of the denominator and zeros are the roots of the numerator. The pole-zero plot helps analyze system behavior and stability. The frequency response shows how the system changes the magnitude and phase of different frequency components.

For the given system:

\[
H(z)=\frac{1}{1+0.5z^{-1}}
\]

**Procedure:**
1. Define numerator and denominator coefficients.
2. Plot the pole-zero diagram using `zplane()`.
3. Define a frequency range from (-\pi) to (\pi).
4. Compute the frequency response using `freqz()`.
5. Plot magnitude and phase responses.

**Conclusion:** The pole-zero plot, magnitude response, and phase response of the given discrete-time system were obtained using MATLAB.