# Practical 02 — Solution of Difference Equation

## Aim
To solve a linear constant-coefficient difference equation with initial conditions using MATLAB and obtain its Zero-Input Response (ZIR), Zero-State Response (ZSR), and Total Response.

## Apparatus
MATLAB

## Theory and Derivation
A difference equation relates present and past samples of an input and output. The total response is the sum of the response due to initial conditions and the response due to the input:

\[
y[n]=y_{\mathrm{ZIR}}[n]+y_{\mathrm{ZSR}}[n]
\]

- **Zero-Input Response (ZIR):** output due only to initial conditions, with the input set to zero.
- **Zero-State Response (ZSR):** output due to the input, with initial conditions set to zero.

### Given equation
\[
y[n]-0.7y[n-1]+0.1y[n-2]=2x[n]+x[n-2]
\]
\[
x[n]=2^n u[n],\qquad y[-1]=1,\quad y[-2]=2
\]
where \(u[n]\) is the unit-step sequence.

### Step 1 — Homogeneous solution
For the homogeneous equation, set the input to zero and assume \(y_h[n]=r^n\):

\[
r^2-0.7r+0.1=0
\]
The roots are \(r_1=0.5\) and \(r_2=0.2\), so:
\[
y_h[n]=C_1(0.5)^n+C_2(0.2)^n
\]

### Step 2 — Particular solution
For \(n\geq2\), assume \(y_p[n]=K2^n\). Substituting into the difference equation:

\[
\begin{aligned}
K2^n-0.7K2^{n-1}+0.1K2^{n-2}&=2(2^n)+2^{n-2}\\
\left(1-0.35+0.025\right)K2^n&=2.25\,2^n\\
0.675K&=2.25\\
K&=\frac{10}{3}
\end{aligned}
\]

Therefore, the total response has the form:
\[
y[n]=C_1(0.5)^n+C_2(0.2)^n+\frac{10}{3}(2)^n
\]

### Step 3 — Determine constants
Using the difference equation with the given initial conditions yields \(y[0]=2.5\) and \(y[1]=5.65\).

At \(n=0\):
\[
C_1+C_2+\frac{10}{3}=2.5
\quad\Rightarrow\quad C_1+C_2=-\frac{5}{6}
\]

At \(n=1\):
\[
0.5C_1+0.2C_2+\frac{20}{3}=5.65
\]

Solving:
\[
C_1=-\frac{17}{6},\qquad C_2=2
\]

### Analytical total response
\[
\boxed{y[n]=-\frac{17}{6}(0.5)^n+2(0.2)^n+\frac{10}{3}(2)^n,\quad n\geq0}
\]

## Algorithm
1. Clear the workspace and figures.
2. Set denominator coefficients \(a=[1,-0.7,0.1]\), numerator coefficients \(b=[2,0,1]\), and sample range \(n=0:6\).
3. Define the input \(x[n]=2^n\) for the selected nonnegative sample indices.
4. Specify initial conditions \(y[-1]=1\), \(y[-2]=2\), and zero input-history values; obtain filter initial states using `filtic()`.
5. Compute ZIR, ZSR, and total response using `filter()`.
6. Compare the total with the sum of ZIR and ZSR and with the analytical expression (within numerical tolerance).
7. Plot the responses using `stem()` and stop.

## Conclusion
The difference equation was solved in MATLAB. The ZIR, ZSR, and total response were computed and compared with the analytical response.
