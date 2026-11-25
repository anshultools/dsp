# Practical 07 — Pole-Zero Plot and Frequency Response

## Aim
To plot the pole-zero diagram and frequency response of a discrete-time system using MATLAB.

## Apparatus
MATLAB

## Theory
A discrete-time system can be represented by its **transfer function**:

$$
H(z)=\frac{Y(z)}{X(z)}
$$

Here, $X(z)$ represents the input and $Y(z)$ represents the output in the Z-transform domain.

- **Zeros** are the values that make the numerator of the transfer function equal to zero.
- **Poles** are the values that make the denominator equal to zero.

The pole-zero plot helps us understand the system's behaviour and stability. For a causal and stable system, all poles must lie inside the unit circle.

### Given system

$$
H(z)=\frac{1}{1+0.5z^{-1}}
$$

For this system, there are no finite zeros, and the pole is at $z=-0.5$.

The **frequency response** shows how the system changes the magnitude and phase of different frequency components. MATLAB's `freqz()` function calculates this response.

## Algorithm
1. Define the numerator and denominator coefficient vectors.
2. Plot the pole-zero diagram using `zplane()`.
3. Set the digital frequency range from $-\pi$ to $\pi$.
4. Calculate the frequency response using `freqz()`.
5. Plot the magnitude and phase responses with proper labels and grid lines.

## Conclusion
The pole-zero diagram and the magnitude and phase responses of the given system were obtained using MATLAB.
