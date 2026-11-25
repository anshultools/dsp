# Practical 10 — Design of Low-Pass IIR Butterworth Filter

## Aim
To design and implement a low-pass Infinite Impulse Response (IIR) filter using Butterworth approximation in MATLAB.

## Apparatus
MATLAB

## Theory and Calculations

An **IIR filter** uses feedback. Its output depends on the present and previous input values as well as previous output values.

The transfer function is simply the output divided by the input in the Z-transform domain:

$$
H(z)=\frac{Y(z)}{X(z)}
$$

A **Butterworth filter** has a smooth, maximally flat magnitude response in its passband.

The `buttord()` function calculates the minimum filter order and cutoff frequency needed to meet the passband and stopband requirements.

### Given filter specifications

- Normalized passband edge: $W_p=0.2$.
- Normalized stopband edge: $W_s=0.3$.
- Maximum passband ripple: $R_p=1\,\text{dB}$.
- Minimum stopband attenuation: $R_s=20\,\text{dB}$.

For MATLAB's digital filter design functions, a normalized frequency of 1 represents the Nyquist frequency, which is half the sampling frequency.

The input signal contains two sine waves:

- Low-frequency component: 50 Hz.
- High-frequency component: 350 Hz.

The sampling frequency used in the MATLAB script is 1000 Hz.

## Algorithm

1. Set the normalized passband edge to $W_p=0.2$ and stopband edge to $W_s=0.3$.
2. Set the maximum passband ripple to 1 dB and minimum stopband attenuation to 20 dB.
3. Use `buttord(Wp,Ws,Rp,Rs)` to calculate the filter order and cutoff frequency.
4. Use `butter()` to calculate the numerator and denominator coefficients of the filter.
5. Plot the filter frequency response using `freqz()`.
6. Generate a composite input signal by adding 50 Hz and 350 Hz sine waves. Use a sampling frequency of 1000 Hz.
7. Apply the filter using `filter()`.
8. Plot the original and filtered signals and observe the attenuation of the 350 Hz component.

## Conclusion

A low-pass IIR Butterworth filter was designed and implemented in MATLAB. The 50 Hz component lies in the passband and is allowed to pass, while the 350 Hz component lies in the stopband and is attenuated.
