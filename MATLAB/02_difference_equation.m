% Practical 02 - Solution of Difference Equation
clc;
clear;
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
z_total = filter(b,a,x,z_ic);

z_ana = -((17/6)*(0.5.^n)) + 2*(0.2.^n) + (10/3)*(2.^n);

sum_response = z_zir + z_zsr;
tol = 1e-10;
fprintf('ZIR + ZSR matches MATLAB total response: %d\n',all(abs(sum_response-z_total)<tol));
fprintf('MATLAB total matches analytical response: %d\n',all(abs(z_total-z_ana)<tol));

figure;
subplot(4,1,1);
stem(n,z_zir,'filled'); grid on;
title('Zero Input Response (ZIR)');
subplot(4,1,2);
stem(n,z_zsr,'filled'); grid on;
title('Zero State Response (ZSR)');
subplot(4,1,3);
stem(n,z_total,'filled'); grid on;
title('Total Response (MATLAB)');
subplot(4,1,4);
stem(n,z_ana,'filled'); grid on;
title('Total Response (Analytical)');
