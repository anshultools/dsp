# Practical 02 — Solution of Difference Equation

## Aim
To solve a given difference equation using MATLAB and obtain the Zero-Input Response (ZIR), Zero-State Response (ZSR), and Total Response.

## Apparatus
MATLAB

## Theory and Calculations

The **total response** is the sum of the response caused by the initial conditions and the response caused by the input signal:

$$
\text{Total Response}=\text{ZIR}+\text{ZSR}
$$

- **ZIR:** Output due only to the initial conditions, when the input is zero.
- **ZSR:** Output due to the input signal, when the initial conditions are zero.

### Given difference equation

$$
y[n]-0.7y[n-1]+0.1y[n-2]=2x[n]+x[n-2]
$$

Initial conditions are $y[-1]=1$ and $y[-2]=2$. The input is:

$$
x[n]=2^n u[n]
$$

Here, $u[n]$ is the unit-step signal.

### Homogeneous solution

The characteristic equation is:

$$
r^2-0.7r+0.1=0
$$

Its roots are $r_1=0.5$ and $r_2=0.2$. Therefore:

$$
y_h[n]=C_1(0.5)^n+C_2(0.2)^n
$$

### Particular solution

Assume the particular solution is:

$$
y_p[n]=K(2)^n
$$

Substituting this into the given difference equation gives $K=10/3$.

Therefore, the total response has the form:

$$
y[n]=C_1(0.5)^n+C_2(0.2)^n+\frac{10}{3}(2)^n
$$

Using the initial conditions gives $y[0]=2.5$ and $y[1]=5.65$. Solving for the constants gives:

$$
C_1=-\frac{17}{6},\qquad C_2=2
$$

### Final analytical response

$$
y[n]=-\frac{17}{6}(0.5)^n+2(0.2)^n+\frac{10}{3}(2)^n
$$

This expression gives the total response for $n\geq0$.

## Algorithm

1. Define the denominator coefficients as `a = [1 -0.7 0.1]` and numerator coefficients as `b = [2 0 1]`.
2. Define the sample range and input signal using `x = 2.^n`.
3. Enter the initial conditions as `yi = [1 2]` and `xi = [0 0]`.
4. Calculate the filter's initial conditions using `filtic(b,a,yi,xi)`.
5. Calculate the ZIR using `filter()` with a zero input.
6. Calculate the ZSR using `filter()` with zero initial conditions.
7. Calculate the total response using `filter()` with the input and initial conditions.
8. Compare the ZIR + ZSR result and MATLAB total response with the analytical response.

## Conclusion

The given difference equation was solved using MATLAB. The ZIR, ZSR, and total response were calculated and compared. The sum of the ZIR and ZSR matches the MATLAB total response and the analytical result.
