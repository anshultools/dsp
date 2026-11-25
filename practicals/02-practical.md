# Practical 02 — Solution of Difference Equation

## Aim
To solve a difference equation in MATLAB and find its Zero-Input Response (ZIR), Zero-State Response (ZSR), and Total Response.

## Apparatus
MATLAB

## Theory
A **difference equation** describes how the current output of a system depends on present and previous input and output values.

The total response is the sum of two parts:

$$
\text{Total Response} = \text{ZIR} + \text{ZSR}
$$

- **Zero-Input Response (ZIR):** Output caused by the initial conditions when the input is zero.
- **Zero-State Response (ZSR):** Output caused by the input when all initial conditions are zero.

### Given difference equation

$$
y[n]-0.7y[n-1]+0.1y[n-2]=2x[n]+x[n-2]
$$

Input signal:

$$
x[n]=2^n,\quad n\geq0
$$

Initial conditions: $y[-1]=1$ and $y[-2]=2$.

### Step 1 — Find the homogeneous solution

First, set the input to zero. The characteristic equation is:

$$
r^2-0.7r+0.1=0
$$

Its roots are 0.5 and 0.2. Therefore:

$$
y_h[n]=C_1(0.5)^n+C_2(0.2)^n
$$

### Step 2 — Find the particular solution

For the input $x[n]=2^n$, assume the particular solution has the same exponential form:

$$
y_p[n]=K(2)^n
$$

Substituting into the difference equation gives $K=3.333$.

Therefore, the total response has the form:

$$
y[n]=C_1(0.5)^n+C_2(0.2)^n+3.333(2)^n
$$

### Step 3 — Apply the initial conditions

Using the given initial conditions in the difference equation:

- At $n=0$, the output is $y[0]=2.5$.
- At $n=1$, the output is $y[1]=5.65$.

Solving for the constants gives $C_1=-2.833$ and $C_2=2$.

### Final response

$$
y[n]=-2.833(0.5)^n+2(0.2)^n+3.333(2)^n
$$

This is the analytical total response for $n\geq0$.

## Algorithm
1. Clear the MATLAB workspace and close all figures.
2. Enter the numerator coefficients as `b = [2 0 1]` and denominator coefficients as `a = [1 -0.7 0.1]`.
3. Define the input samples using $x[n]=2^n$ and set the sample range.
4. Enter the initial conditions $y[-1]=1$ and $y[-2]=2$.
5. Use `filtic()` to set the filter's initial conditions.
6. Use `filter()` to calculate the ZIR, ZSR, and total response.
7. Compare the MATLAB result with the analytical response and plot the results using `stem()`.

## Conclusion
The given difference equation was solved using MATLAB. The Zero-Input Response, Zero-State Response, and Total Response were calculated and compared with the analytical response.
