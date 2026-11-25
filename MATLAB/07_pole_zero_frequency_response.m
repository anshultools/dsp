% Practical 07 - Pole-Zero Plot and Frequency Response
clc;
clear all;
close all;
num = [1];
den = [1 0.5];

% Pole-zero plot
figure;
zplane(num,den);
grid on;
title('Pole-Zero Plot of H(z)');
xlabel('Real Part');
ylabel('Imaginary Part');

% Frequency response
w = -pi:0.01:pi;
H = freqz(num,den,w);

% Magnitude response
figure;
plot(w,abs(H),'LineWidth',1.5);
grid on;
title('Magnitude Response');
xlabel('Frequency (rad/sample)');
ylabel('|H(e^{j\omega})|');

% Phase response
figure;
plot(w,angle(H),'LineWidth',1.5);
grid on;
title('Phase Response');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');