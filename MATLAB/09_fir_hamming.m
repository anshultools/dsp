% Practical 09 - Low-Pass FIR Filter Using Hamming Window
clc;
clear;
close all;

%% Generate the composite input signal
f1 = 10;                  % First input frequency in Hz
f2 = 20;                  % Second input frequency in Hz
f3 = 30;                  % Third input frequency in Hz
f = [f1 f2 f3];

fs = 4 * max(f);          % Sampling frequency = 120 Hz
t = 0:1/fs:1;             % Time vector from 0 to 1 second

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x3 = sin(2*pi*f3*t);
x = x1 + x2 + x3;         % Composite input signal

%% Low-pass filter specifications
fpb = min(f);             % Passband edge frequency = 10 Hz
fsb = 1.4 * fpb;          % Stopband edge frequency = 14 Hz

delf = (fsb - fpb) / fs;  % Normalized transition width
wpb = 2 * fpb / fs;       % Normalized passband edge
wsb = 2 * fsb / fs;       % Normalized stopband edge
wc = (wpb + wsb) / 2;     % Normalized cutoff frequency

flen = ceil(3.3 / delf);  % Hamming-window length
ord = flen - 1;           % FIR filter order

fprintf('Sampling frequency: %g Hz\n', fs);
fprintf('Passband edge: %g Hz\n', fpb);
fprintf('Stopband edge: %g Hz\n', fsb);
fprintf('Cutoff frequency: %g Hz\n', wc * fs / 2);
fprintf('Window length: %d samples\n', flen);
fprintf('Filter order: %d\n', ord);

%% Design the low-pass FIR filter using a Hamming window
window = hamming(flen);
b = fir1(ord, wc, 'low', window);
a = 1;                    % Denominator for an FIR filter

figure;
freqz(b, a, 1024, fs);
title('Low-Pass FIR Filter Using Hamming Window');

%% Filter the composite input signal
filt_out = filter(b, a, x);

%% Calculate single-sided FFT magnitude spectra
N = 128;
signalLength = length(x);

Y = abs(fft(x, N)) / signalLength;
Y1 = abs(fft(filt_out, N)) / signalLength;

% Keep the nonnegative-frequency components
Y = Y(1:N/2+1);
Y1 = Y1(1:N/2+1);

% Convert to a single-sided amplitude spectrum
Y(2:end-1) = 2 * Y(2:end-1);
Y1(2:end-1) = 2 * Y1(2:end-1);

F = (0:N/2) * fs / N;     % Frequency axis in Hz

%% Plot the input signal and frequency spectra
figure;

subplot(3,1,1);
plot(t, x);
grid on;
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Composite Input Signal');

subplot(3,1,2);
plot(F, Y);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Original Signal');

subplot(3,1,3);
plot(F, Y1);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Low-Pass Filter Output');
