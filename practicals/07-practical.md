# Practical 07 — Pole-Zero Plot and Frequency Response

## Aim
To plot the pole-zero diagram and frequency response of a discrete-time system using MATLAB.

## Apparatus
MATLAB

## Theory
A discrete-time linear system can be described by its transfer function:
\[
H(z)=\frac{B(z)}{A(z)}
\]
The **zeros** are the roots of the numerator \(B(z)\), and the **poles** are the roots of the denominator \(A(z)\). The pole-zero diagram helps examine the system's characteristics and stability. For a causal, stable LTI system, all poles must lie inside the unit circle.

The frequency response is obtained by evaluating the transfer function on the unit circle, \(z=e^{j\omega}\):
\[
H(e^{j\omega})=H(z)\big|_{z=e^{j\omega}}
\]
Its magnitude and phase show how the system affects each frequency component.

### Given system
\[
H(z)=\frac{1}{1+0.5z^{-1}}
\]
The system has no finite zeros and a pole at \(z=-0.5\).

## Algorithm
1. Define the numerator and denominator coefficient vectors.
2. Plot the pole-zero diagram using `zplane()`.
3. Define digital angular frequency \(\omega\) over the range \(-\pi\) to \(\pi\).
4. Compute the frequency response using `freqz()`.
5. Plot magnitude and phase response with axis labels and grid.

## Conclusion
The pole-zero diagram, magnitude response, and phase response of the given discrete-time system were obtained using MATLAB.
