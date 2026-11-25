% Practical 06 - Verification of DFT Properties
clc;
clear;
close all;

% Inputs for the practical
N = 4;
x1 = [1 2 3 4];
x2 = [2 1 2 1];
p = 2;
q = 3;
k = 0:N-1;

% DFTs of the two input sequences
X1 = fft(x1, N);
X2 = fft(x2, N);

%% A) Linearity property
x3 = p*x1 + q*x2;          % Combine sequences in time domain
X3 = fft(x3, N);           % DFT of combined sequence
X4 = p*X1 + q*X2;         % Combine DFTs in frequency domain

fprintf('Linearity property verified: %s\n', ...
    mat2str(round(X3, 10) == round(X4, 10)));

figure;
subplot(2,1,1);
stem(k, abs(X3), 'filled');
title('DFT of Combined Sequence');
xlabel('Frequency Bin k'); ylabel('Magnitude'); grid on;

subplot(2,1,2);
stem(k, abs(X4), 'filled');
title('Weighted Sum of Individual DFTs');
xlabel('Frequency Bin k'); ylabel('Magnitude'); grid on;

%% B) Circular time-shifting property
m = 3;
xs = circshift(x1, m);      % Circular shift to the right by m samples
Xs = fft(xs, N);
Xs_theory = X1 .* exp(-1j*2*pi*k*m/N);

fprintf('Time-shifting property verified: %s\n', ...
    mat2str(round(Xs, 10) == round(Xs_theory, 10)));

figure;
subplot(2,2,1);
stem(k, abs(X1), 'filled');
title('Original Magnitude Spectrum');
xlabel('Frequency Bin k'); ylabel('|X_1[k]|'); grid on;

subplot(2,2,2);
stem(k, abs(Xs), 'filled');
title('Shifted Magnitude Spectrum');
xlabel('Frequency Bin k'); ylabel('|X_s[k]|'); grid on;

subplot(2,2,3);
stem(k, angle(X1), 'filled');
title('Original Phase Spectrum');
xlabel('Frequency Bin k'); ylabel('Phase (rad)'); grid on;

subplot(2,2,4);
stem(k, angle(Xs), 'filled');
title('Shifted Phase Spectrum');
xlabel('Frequency Bin k'); ylabel('Phase (rad)'); grid on;

%% C) Circular convolution property
Xproduct = X1 .* X2;
xc_from_dft = ifft(Xproduct, N);
xc_direct = cconv(x1, x2, N);

fprintf('Circular convolution property verified: %s\n', ...
    mat2str(round(xc_from_dft, 10) == round(xc_direct, 10)));

figure;
subplot(2,1,1);
stem(k, real(xc_from_dft), 'filled');
title('IDFT of Product of DFTs');
xlabel('Sample n'); ylabel('Amplitude'); grid on;

subplot(2,1,2);
stem(k, xc_direct, 'filled');
title('Direct Circular Convolution');
xlabel('Sample n'); ylabel('Amplitude'); grid on;
