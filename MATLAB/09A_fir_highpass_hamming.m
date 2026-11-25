% Practical 09A - High-Pass FIR Filter Using Hamming Window
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

%% High-pass FIR filter specifications
fpb = max(f);             % Passband edge frequency = 30 Hz
fsb = 0.6 * fpb;          % Stopband edge frequency = 18 Hz

delta_f = (fpb - fsb) / fs;
Wpb = 2 * fpb / fs;       % Normalized passband edge
Wsb = 2 * fsb / fs;       % Normalized stopband edge
Wc = (Wpb + Wsb) / 2;     % Normalized cutoff frequency

filterLength = ceil(3.3 / delta_f);
filterOrder = filterLength - 1;

fprintf('Sampling frequency: %g Hz\n', fs);
fprintf('Stopband edge: %g Hz\n', fsb);
fprintf('Passband edge: %g Hz\n', fpb);
fprintf('Cutoff frequency: %g Hz\n', Wc * fs / 2);
fprintf('Filter order: %d\n', filterOrder);

%% Design the high-pass FIR filter using a Hamming window
window = hamming(filterLength);
b = fir1(filterOrder, Wc, 'high', window);
a = 1;                    % Denominator for an FIR filter

figure;
freqz(b, a, 1024, fs);
title('High-Pass FIR Filter Frequency Response');

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
title('Single-Sided Spectrum of High-Pass Filter Output');
