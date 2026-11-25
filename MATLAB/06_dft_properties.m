% Practical 06 - Verification of DFT Properties
clc;
clear all;
close all;
N = 8;
x1 = [1 2 3 4 0 0 0 0];
x2 = [2 1 2 1 0 0 0 0];

% Linearity property
a1 = 0.5;
a2 = 0.5;
X1 = fft(x1,N);
X2 = fft(x2,N);
x3 = (a1*x1) + (a2*x2);
X3 = fft(x3,N);
X4 = (a1*X1) + (a2*X2);
K = 0:N-1;
figure;
subplot(2,1,1);
stem(K,abs(X3));
title('DFT of Linear Combination'); xlabel('K'); ylabel('|X3|');
subplot(2,1,2);
stem(K,abs(X4));
title('Linear Combination of DFTs'); xlabel('K'); ylabel('|X4|');

% Time shifting property
P = 2;
x5 = circshift(x2,P);
X5 = fft(x5,N);
X5_mag = abs(X5);
X5_ph = angle(X5);
figure;
subplot(2,1,1);
stem(K,X5_mag);
title('Magnitude of Time Shifted DFT'); xlabel('K'); ylabel('|X5|'); grid on;
subplot(2,1,2);
stem(K,X5_ph);
title('Phase of Time Shifted DFT'); xlabel('K'); ylabel('Phase'); grid on;

% Circular convolution property
Xprod = X1 .* X2;
xnew = ifft(Xprod,N);
xnew1 = cconv(x1,x2,N);
figure;
subplot(2,1,1);
stem(K,abs(xnew));
title('IFFT of Product of DFTs'); xlabel('K'); ylabel('Amplitude'); grid on;
subplot(2,1,2);
stem(K,abs(xnew1));
title('Circular Convolution'); xlabel('K'); ylabel('Amplitude'); grid on;