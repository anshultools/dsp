% Practical 02 - Solution of Difference Equation with Initial Condition
clc;
clear all;
close all;
a = [1 -0.7 0.1];
b = [2 0 1];
n = 0:6;
x = 2.^n;
yi = [1 2];
xi = [0 0];
z_ic = filtic(b,a,yi,xi);
z_zir = filter(b,a,zeros(size(n)),z_ic);
z_zsr = filter(b,a,x);
z = filter(b,a,x,z_ic);
isequal(z,z_zir + z_zsr)
z_ana = (-((17/6)*(0.5.^n)) + 2*(0.2.^n) + ((10/3)*(2.^n)));
subplot(4,1,1)
stem(n,z_zir); grid on
title('Zero Input Response of Difference Equation - MATLAB Solution')
subplot(4,1,2)
stem(n,z_zsr); grid on
title('Zero State Response of Difference Equation - MATLAB Solution')
subplot(4,1,3)
stem(n,z); grid on
title('Total Response of Difference Equation - MATLAB Solution')
subplot(4,1,4)
stem(n,z_ana); grid on
title('Total Response of Difference Equation - Analytical Solution')