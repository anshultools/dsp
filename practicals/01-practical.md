# Practical 01 — Verification of Sampling Theorem

## Aim
To verify the Sampling Theorem using MATLAB.

## Apparatus
MATLAB

## Theory

The **Sampling Theorem** states that a signal can be reconstructed correctly when its sampling frequency is at least twice its highest frequency.

$$
F_s \geq 2F_{\max}
$$

Here, $F_s$ is the sampling frequency and $F_{\max}$ is the highest frequency in the signal. In practical systems, a sampling frequency higher than this minimum is usually preferred.

A continuous-time cosine signal is:

$$
x(t)=A\cos(2\pi ft)
$$

When sampled at frequency $F_s$, its discrete-time samples are:

$$
x[n]=A\cos\left(\frac{2\pi fn}{F_s}\right)
$$

### Given values

- First signal frequency: $f_1=10\,\text{Hz}$
- Second signal frequency: $f_2=50\,\text{Hz}$
- First sampling frequency: $F_s=40\,\text{Hz}$
- Amplitude: $A=1$

### Case 1 — Sampling at 40 Hz

For the 10 Hz signal:

$$
x_1[n]=A\cos\left(\frac{\pi n}{2}\right)
$$

For the 50 Hz signal:

$$
x_2[n]=A\cos\left(\frac{5\pi n}{2}\right)
$$

Since cosine repeats every $2\pi$, this becomes:

$$
x_2[n]=A\cos\left(\frac{\pi n}{2}\right)
$$

Both signals therefore produce the same sample values. The 50 Hz signal appears like a 10 Hz signal after sampling. This effect is called **aliasing**.

The required sampling frequency for a 50 Hz signal is:

$$
F_s=2\times50=100\,\text{Hz}
$$

Since the actual sampling frequency is only 40 Hz, aliasing occurs.

### Case 2 — Sampling at 100 Hz

At $F_s=100\,\text{Hz}$:

- For 10 Hz: $f_1/F_s=0.1$ cycles per sample.
- For 50 Hz: $f_2/F_s=0.5$ cycles per sample.

The 50 Hz signal is now sampled exactly at the Nyquist rate. This is the theoretical minimum sampling frequency for that signal.

## Algorithm

1. Set the amplitude to $A=1$, signal frequencies to 10 Hz and 50 Hz, and sampling frequency to 40 Hz.
2. Create a continuous-time vector from 0 to 1 second with a step of 0.001 second.
3. Generate and plot the continuous 10 Hz and 50 Hz cosine signals.
4. Generate the sample times using a step of $1/F_s$ and calculate the sampled signals.
5. Plot and compare the samples to observe aliasing.
6. Repeat the sampling at $F_s=100\,\text{Hz}$ and compare the results.

## Conclusion

At $F_s=40\,\text{Hz}$, the 10 Hz and 50 Hz signals produce identical samples, demonstrating aliasing. At $F_s=100\,\text{Hz}$, the sampling frequency reaches the Nyquist rate for the 50 Hz signal. In practical reconstruction systems, sampling above the Nyquist rate is generally preferred.
