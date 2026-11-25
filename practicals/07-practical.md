# Practical 07 — Pole-Zero Plot and Frequency Response Using Z-Transform

## Aim
To plot the pole-zero diagram and the magnitude and phase frequency responses of a discrete-time system using MATLAB.

## Apparatus
MATLAB

## Theory and Calculations

A discrete-time system can be described by its **transfer function**:

$$
H(z)=\frac{Y(z)}{X(z)}
$$

Here, $X(z)$ is the input and $Y(z)$ is the output in the Z-transform domain.

### Given transfer function

$$
H(z)=\frac{1}{1+0.25z^{-1}}
$$

Multiplying the numerator and denominator by $z$ gives:

$$
H(z)=\frac{z}{z+0.25}
$$

- **Zero:** $z=0$
- **Pole:** $z=-0.25$

### Frequency response

To find the frequency response, replace $z$ with $e^{j\omega}$:

$$
H(e^{j\omega})=\frac{1}{1+0.25e^{-j\omega}}
$$

Using Euler's formula, $e^{-j\omega}=\cos\omega-j\sin\omega$:

$$
H(e^{j\omega})=
\frac{1}{(1+0.25\cos\omega)-j(0.25\sin\omega)}
$$

### Magnitude response

The magnitude response is:

$$
|H(e^{j\omega})|=
\frac{1}{\sqrt{1.0625+0.5\cos\omega}}
$$

At $\omega=0$:

$$
|H(e^{j0})|=0.8
$$

At $\omega=\pi$:

$$
|H(e^{j\pi})|\approx1.333
$$

### Phase response

The phase response is:

$$
\angle H(e^{j\omega})=
\tan^{-1}\left(\frac{0.25\sin\omega}{1+0.25\cos\omega}\right)
$$

MATLAB calculates the pole-zero plot using `zplane()` and the frequency response using `freqz()`.

## Algorithm

1. Define the numerator as `num = [1]` and denominator as `den = [1 0.25]`.
2. Plot the poles and zeros using `zplane(num,den)`.
3. Define the frequency range from $-\pi$ to $\pi$.
4. Calculate the frequency response using `freqz(num,den,w)`.
5. Calculate the magnitude using `abs(H)` and phase using `angle(H)`.
6. Plot the magnitude and phase responses against frequency.
7. Compare the MATLAB plots with the calculated values.

## Conclusion

The pole-zero plot and frequency response of the given system were obtained using MATLAB. The system has a zero at the origin and a pole at $-0.25$. The magnitude and phase plots were compared with the theoretical calculations.
