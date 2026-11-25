# Practical 06 — Verification of DFT Properties

## Write-Up

**Aim:** To verify the linearity, time-shifting, and circular convolution properties of the Discrete Fourier Transform (DFT) using MATLAB.

**Theory:** The DFT transforms a finite discrete-time sequence into its frequency-domain representation. Important DFT properties include:

- **Linearity:** The DFT of a weighted sum of sequences equals the same weighted sum of their DFTs.
- **Time shifting:** Circularly shifting a sequence changes the phase of its DFT while preserving the magnitude.
- **Circular convolution:** Circular convolution in time corresponds to multiplication in the frequency domain.

**Procedure:**
1. Define two input sequences and compute their DFTs.
2. Verify linearity by comparing the DFT of a weighted sum with the weighted sum of individual DFTs.
3. Circularly shift one sequence and plot the magnitude and phase of its DFT.
4. Multiply the two DFTs, take the inverse DFT, and compare with circular convolution.
5. Plot and compare the results.

**Conclusion:** The linearity, time-shifting, and circular convolution properties of the DFT were demonstrated using MATLAB.