% Practical 04 - Verification of DTFT Properties
clc;
clear;
close all;
w = (-pi:(pi/1000):pi);
% DTFT of x(n) = (0.25)^n u(n)
x_dtft = 1 ./ (1 - 0.25*exp(-1j*w));
% DTFT of shifted signal (source comment says n-2; exponent uses delay 3)
x_shift_dtft = exp(-3j*w) .* x_dtft;
x_dtft_mag = abs(x_dtft);
x_dtft_phase = angle(x_dtft);
x_shift_mag = abs(x_shift_dtft);
x_shift_phase = angle(x_shift_dtft);
figure;
subplot(2,2,1);
plot(w,x_dtft_mag); grid on;
title('Magnitude of X(e^{j\omega})'); xlabel('\omega'); ylabel('Magnitude');
subplot(2,2,2);
plot(w,x_dtft_phase); grid on;
title('Phase of X(e^{j\omega})'); xlabel('\omega'); ylabel('Phase');
subplot(2,2,3);
plot(w,x_shift_mag); grid on;
title('Magnitude of X_s(e^{j\omega})'); xlabel('\omega'); ylabel('Magnitude');
subplot(2,2,4);
plot(w,x_shift_phase); grid on;
title('Phase of X_s(e^{j\omega})'); xlabel('\omega'); ylabel('Phase');