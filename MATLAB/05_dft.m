% Practical 05 - DFT
clc;
close all;
clear all;
f1 = 10;
f2 = 50;
f3 = 100;
f = [f1 f2 f3];
fs = 4*max(f); % Sampling frequency
n = 0:(1/fs):1;
x1 = sin(2*3.14*f1*n);
x2 = sin(2*3.14*f2*n);
x3 = sin(2*3.14*f3*n);
x = x1+x2+x3; % Composite signal
figure, plot(n,x)
% Detection of frequencies using DFT
N = 128;
y = fft(x,N); % FFT of composite signal
y = abs(y); % Magnitude of complex DFT
k = [0:N-1]; % DFT sample number
F = (fs/N)*(k); % Analog frequency axis
figure
subplot(2,1,1)
plot(n,x);
grid on;
title('Composite signal');
subplot(2,1,2)
stem(F,y);
grid on;
title('Detected freq. peaks in composite signal');