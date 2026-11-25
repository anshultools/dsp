# Practical 02 — Solution of Difference Equation

## Write-Up

**Aim:** To solve a linear constant-coefficient difference equation with initial conditions using MATLAB and obtain the Zero-Input Response (ZIR), Zero-State Response (ZSR), and Total Response.

**Apparatus:** MATLAB

## Theory and Derivation

A difference equation relates present and past values of discrete-time input and output signals. The total system response is the sum of the zero-input response and zero-state response:

\[
Y[n]=Y_{\mathrm{ZIR}}[n]+Y_{\mathrm{ZSR}}[n]
\]

- **Zero-Input Response (ZIR):** The output produced only by initial conditions when the input is zero.
- **Zero-State Response (ZSR):** The output produced by the input signal when initial conditions are zero.

### Given problem

\[
y[n]-0.7y[n-1]+0.1y[n-2]=2x[n]+x[n-2]
\]

where

\[
x[n]=2^n u[n],\qquad y[-1]=1,\quad y[-2]=2
\

### Step 1 — Homogeneous solution

Setting \(x[n]=0\) and assuming \(y_h[n]=d^n\):

\[
d^n-0.7d^{n-1}+0.1d^{n-2}=0
\]

\[
d^2-0.7d+0.1=0
\]

The roots are \(d_1=0.5\) and \(d_2=0.2\), giving:

\[
y_h[n]=C_1(0.5)^n+C_2(0.2)^n
\

### Step 2 — Particular solution

Assume \(y_p[n]=K2^n\). Substituting into the equation for \(n\geq2\):

\[
4K-1.4K+0.1K=9
\

\[
2.7K=9\quad\Rightarrow\quad K=\frac{10}{3}
\

The general solution for \(n\geq0\) is:

\[
Y[n]=C_1(0.5)^n+C_2(0.2)^n+\frac{10}{3}(2)^n
\

### Step 3 — Determine the constants

Using the difference equation recursively gives \(Y[0]=2.5\) and \(Y[1]=5.65\).

At \(n=0\):

\[
C_1+C_2+\frac{10}{3}=2.5\quad\Rightarrow\quad C_1+C_2=-\frac{5}{6}
\

At \(n=1\):

\[
0.5C_1+0.2C_2+\frac{20}{3}=5.65
\

Solving gives \(C_1=-\frac{17}{6}\) and \(C_2=2\).

### Analytical total response

\[
\boxed{Y[n]=-\frac{17}{6}(0.5)^n+2(0.2)^n+\frac{10}{3}(2)^n,\quad n\geq0}
\

## Algorithm

1. Clear the workspace and figures (`clc`, `clear all`, `close all`).
2. Set `a = [1 -0.7 0.1]`, `b = [2 0 1]`, sample range `n = 0:6`, and input `x = 2.^n`.
3. Set initial conditions `yi = [1 2]`, `xi = [0 0]`, and calculate equivalent filter initial conditions using `filtic`.
4. Calculate ZIR, ZSR, and total response using `filter`.
5. Add ZIR and ZSR, and verify that their sum matches the MATLAB total response and analytical response within a numerical tolerance.
6. Plot the responses using `stem()` and stop.

## Conclusion

The given difference equation was solved using MATLAB. The Zero-Input Response, Zero-State Response, and Total Response were computed and checked against the analytical solution.
