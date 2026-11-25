# Practical 02 — Solution of Difference Equation with Initial Condition

## Write-Up

**Aim:** To obtain the zero-input, zero-state, and total responses of a difference equation using MATLAB and verify the total response.

**Theory:** A difference equation describes a discrete-time system by relating its current output to previous outputs and input samples. The total response is the sum of the zero-input response (due to initial conditions) and the zero-state response (due to the input).

**Procedure:**
1. Define the system coefficients and input sequence.
2. Specify the initial conditions.
3. Use `filtic` to form initial filter states.
4. Use `filter` to compute the zero-input, zero-state, and total responses.
5. Plot the responses and compare the total MATLAB response with the analytical response.

**Conclusion:** The difference equation responses were computed and plotted in MATLAB, showing the zero-input, zero-state, and total response.
