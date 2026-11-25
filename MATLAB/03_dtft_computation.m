% Practical 03 - Computation of DTFT
clc;
clear;
close;
w = -pi:0.001:pi;
x = 1;
deno = ones(1,length(w))+0.25*exp(-1j*w);
y = x./deno;
xmag = abs(y);
xphase = angle(y);
subplot(2,1,1);
plot(w,xmag);
title('Magnitude Response'); xlabel('Frequency'); ylabel('Magnitude'); grid on;
subplot(2,1,2);
plot(w,xphase);
title('Phase Response'); xlabel('Frequency'); ylabel('Phase'); grid on;