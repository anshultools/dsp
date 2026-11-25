% Practical 09B - Band-Pass FIR Filter Using Hamming Window
clc;
clear;
close all;

%% Generate the composite input signal
f1 = 10;                  % First input frequency in Hz
f2 = 20;                  % Second input frequency in Hz
f3 = 30;                  % Third input frequency in Hz
f = [f1 f2 f3];

fs = 4 * max(f);          % Sampling frequency = 120 Hz
t = 0:1/fs:1-1/fs;        % One second of samples (120 samples)

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x3 = sin(2*pi*f3*t);
x = x1 + x2 + x3;         % Composite input signal

%% Band-pass FIR filter specifications
fpb1 = 15;                % Lower passband edge in Hz
fpb2 = 30;                % Upper passband edge in Hz
fsb1 = 10;                % Lower stopband edge in Hz
fsb2 = 35;                % Upper stopband edge in Hz

delta_f1 = (fpb1 - fsb1) / fs;
delta_f2 = (fsb2 - fpb2) / fs;
delta_f = min(delta_f1, delta_f2);

Wpb1 = 2 * fpb1 / fs;     % Lower normalized passband edge
Wpb2 = 2 * fpb2 / fs;     % Upper normalized passband edge
Wsb1 = 2 * fsb1 / fs;     % Lower normalized stopband edge
Wsb2 = 2 * fsb2 / fs;     % Upper normalized stopband edge

Wc1 = (Wpb1 + Wsb1) / 2;  % Lower normalized cutoff frequency
Wc2 = (Wpb2 + Wsb2) / 2;  % Upper normalized cutoff frequency

filterLength = ceil(3.3 / delta_f);
filterOrder = filterLength - 1;

fprintf('Sampling frequency: %g Hz\n', fs);
fprintf('Lower cutoff frequency: %.2f Hz\n', Wc1 * fs / 2);
fprintf('Upper cutoff frequency: %.2f Hz\n', Wc2 * fs / 2);
fprintf('Filter order: %d\n', filterOrder);

%% Design the band-pass FIR filter using a Hamming window
window = hamming(filterLength);
b = fir1(filterOrder, [Wc1 Wc2], 'bandpass', window);
a = 1;                    % Denominator for an FIR filter

figure;
freqz(b, a, 1024, fs);
title('Band-Pass FIR Filter Frequency Response');

%% Apply the filter to the input signal
filteredSignal = filter(b, a, x);

%% Calculate single-sided FFT magnitude spectra
N = 128;
signalLength = length(x);

X = abs(fft(x, N)) / signalLength;
Y = abs(fft(filteredSignal, N)) / signalLength;

% Keep only the nonnegative-frequency components
X = X(1:N/2+1);
Y = Y(1:N/2+1);

% Convert to a single-sided amplitude spectrum
X(2:end-1) = 2 * X(2:end-1);
Y(2:end-1) = 2 * Y(2:end-1);

F = (0:N/2) * fs / N;

%% Plot input and frequency spectra
figure;

subplot(3,1,1);
plot(t, x);
grid on;
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Composite Input Signal');

subplot(3,1,2);
plot(F, X);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Single-Sided Spectrum of Input Signal');

subplot(3,1,3);
plot(F, Y);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Single-Sided Spectrum of Band-Pass Filter Output');
