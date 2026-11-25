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
Ts = 1 / fs;              % Sampling interval
t = 0:Ts:1-Ts;            % One second of samples (120 samples)

x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x3 = sin(2*pi*f3*t);
x = x1 + x2 + x3;         % Composite input signal

%% High-pass filter specifications
fsb = 10;                 % Stopband edge frequency in Hz
fpb = 20;                 % Passband edge frequency in Hz

delta_f = (fpb - fsb) / fs;
Wpb = 2 * fpb / fs;       % Normalized passband edge
Wsb = 2 * fsb / fs;       % Normalized stopband edge
Wc = (Wpb + Wsb) / 2;     % Normalized cutoff frequency

filterOrder = round(3.3 / delta_f);
windowLength = filterOrder + 1;

fprintf('Sampling frequency: %.2f Hz\n', fs);
fprintf('Stopband edge: %.2f Hz\n', fsb);
fprintf('Passband edge: %.2f Hz\n', fpb);
fprintf('Cutoff frequency: %.2f Hz\n', Wc * fs / 2);
fprintf('Filter order: %d\n', filterOrder);
fprintf('Hamming window length: %d samples\n', windowLength);

%% Design the high-pass FIR filter using a Hamming window
window = hamming(windowLength);
b = fir1(filterOrder, Wc, 'high', window);
a = 1;                    % Denominator for an FIR filter

figure;
freqz(b, a, 1024, fs);
title('High-Pass FIR Filter Using Hamming Window');

%% Apply the filter to the composite input signal
filteredSignal = filter(b, a, x);

%% Calculate single-sided FFT magnitude spectra
Nfft = 128;
signalLength = length(x);

X = abs(fft(x, Nfft)) / signalLength;
Y = abs(fft(filteredSignal, Nfft)) / signalLength;

% Keep only the nonnegative-frequency components
X = X(1:Nfft/2+1);
Y = Y(1:Nfft/2+1);

% Convert to single-sided amplitude spectra
X(2:end-1) = 2 * X(2:end-1);
Y(2:end-1) = 2 * Y(2:end-1);

F = (0:Nfft/2) * fs / Nfft;

%% Plot the input signal and frequency spectra
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
title('Single-Sided Spectrum of Original Signal');

subplot(3,1,3);
plot(F, Y);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Single-Sided Spectrum of High-Pass Filter Output');
