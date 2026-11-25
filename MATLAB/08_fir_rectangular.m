% Practical 08 - Low-Pass FIR Filter Using Rectangular Window
clc;
close all;
clear all;
f1 = 10;
f2 = 20;
f3 = 30;
f = [f1 f2 f3];
fs = 4*max(f); % Sampling frequency
n = 0:1/fs:1;
x1 = sin(2*3.14*f1*n);
x2 = sin(2*3.14*f2*n);
x3 = sin(2*3.14*f3*n);
x = x1+x2+x3;

% Low-pass filter specifications
fpb = min(f);
fsb = 1.4*fpb;
delf = (fsb-fpb)/fs;
wpb = 2*fpb/fs;
wsb = 2*fsb/fs;
wc = (wpb+wsb)/2;
flen = 0.9/delf;
flen = ceil(flen);
ord = flen-1;
window = rectwin(flen);
b = fir1(ord,wc,'low',window);
a = 1;
figure;
freqz(b,a);
filt_out = filter(b,a,x);

% DFT frequency analysis
N = 128;
y = abs(fft(x,N));
y1 = abs(fft(filt_out,N));
k = 0:N-1;
F = (fs/N)*k;
figure;
subplot(3,1,1);
plot(n,x); grid on;
title('Composite Signal');
subplot(3,1,2);
plot(F,y); grid on;
title('Detected Frequency Peaks in Composite Signal');
subplot(3,1,3);
plot(F,y1); grid on;
title('Detected Frequency Peaks in Filtered Output');