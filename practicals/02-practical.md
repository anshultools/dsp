# Practical 02 — Solution of Difference Equation with Initial Condition

## Write-Up

**Aim:** To obtain the zero-input, zero-state, and total responses of a difference equation using MATLAB and verify the total response.

**Theory:** A difference equation describes a discrete-time system by relating current and previous output samples to input samples. The total response is the sum of the zero-input response (caused by initial conditions) and zero-state response (caused by the input).

**Procedure:** Define system coefficients and input; specify initial conditions; use `filtic` to form filter states; calculate zero-input, zero-state and total responses using `filter`; plot these responses and compare with the analytical response.

**Conclusion:** The zero-input, zero-state, total MATLAB response, and analytical response of the difference equation were plotted and studied.