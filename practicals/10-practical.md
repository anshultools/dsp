# Practical 10 — IIR Low-Pass Filter Using Butterworth Approximation

## Aim
To design and implement an Infinite Impulse Response (IIR) low-pass Butterworth filter in MATLAB and observe its filtering effect.

## Apparatus
MATLAB

## Theory
An **IIR filter** uses feedback. This means its output depends on current and previous input samples and also on previous output samples. Its impulse response can continue for an unlimited number of samples.

A filter is described by its transfer function:

$$
H(z)=\frac{Y(z)}{X(z)}
$$

Here, $X(z)$ is the input and $Y(z)$ is the output in the Z-transform domain.

A **Butterworth filter** has a smooth, maximally flat magnitude response in its passband.

### Given filter specifications
- Normalized passband edge: $W_p=0.2$.
- Normalized stopband edge: $W_s=0.3$.
- Maximum passband ripple: $R_p=1\,\text{dB}$.
- Minimum stopband attenuation: $R_s=20\,\text{dB}$.

For MATLAB's digital filter design functions, a normalized frequency of 1 represents the Nyquist frequency, which is half the sampling frequency.

### MATLAB functions used
- `buttord()` calculates the required Butterworth filter order and cutoff frequency.
- `butter()` designs the Butterworth filter and returns its coefficients.
- `freqz()` displays the magnitude and phase frequency responses.
- `filter()` applies the filter to the input signal.

## Algorithm
1. Clear the MATLAB workspace and close all figures.
2. Enter the normalized passband and stopband frequencies as 0.2 and 0.3.
3. Set the passband ripple to 1 dB and stopband attenuation to 20 dB.
4. Use `buttord()` to calculate the filter order and cutoff frequency.
5. Use `butter()` to design the IIR Butterworth filter.
6. Plot its magnitude and phase responses using `freqz()`.
7. Generate an input signal containing 50 Hz and 350 Hz components, using the sampling frequency specified in the MATLAB script.
8. Apply the filter using `filter()` and plot the original and filtered signals.
9. Compare the plots to observe attenuation of the high-frequency component.

## Conclusion
An IIR low-pass Butterworth filter was designed and implemented in MATLAB. Its frequency response and effect on the input signal were observed by comparing the original and filtered signals.
