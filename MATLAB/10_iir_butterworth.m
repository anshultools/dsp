% Practical 10 - IIR Butterworth Filter Design
clc;
clear;
close all;

% Filter specifications
wp = 0.2;       % Normalized passband edge frequency
ws = 0.3;       % Normalized stopband edge frequency
Ap = 1;         % Passband ripple in dB
As = 20;        % Stopband attenuation in dB

% Calculate filter order and cutoff frequency
[n,wn] = buttord(wp,ws,Ap,As);
fprintf('Calculated Filter Order (n): %d\n',n);
fprintf('Calculated Cut-off Frequency (wn): %.4f\n',wn);

% Design Butterworth filter
[b,a] = butter(n,wn);

% Frequency response
figure;
freqz(b,a);
title(['Frequency Response of Butterworth Filter (Order = ',num2str(n),')']);

% Test signal (low frequency + high frequency)
fs = 1000;
t = 0:1/fs:0.1;
x = sin(2*pi*50*t)+sin(2*pi*350*t);
y = filter(b,a,x);

% Input and filtered output comparison
figure;
subplot(2,1,1);
plot(t,x,'b','LineWidth',1.5);
title('Original Input Signal (with High-Frequency Noise)');
grid on;
subplot(2,1,2);
plot(t,y,'r','LineWidth',1.5);
title('Filtered Output Signal (Low-pass Filtered)');
grid on;