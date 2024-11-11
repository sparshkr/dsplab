% Parameters
n = 0:1:25;              % Discrete time index
f1 = 0.0625;             % Frequency of the first sine component
f2 = 0.2;                % Frequency of the second sine component

% Generate the discrete-time signal x[n]
x_n = 0.8 * sin(2 * pi * f1 * n) + 0.3 * sin(2 * pi * f2 * n);

% Downsample the signal by a factor of 2
x_n_downsampled = x_n(1:2:end);  % Take every second sample

% Interpolate the downsampled signal by a factor of 2 using zero padding
M = 2;  % Interpolation factor
x_n_interpolated = zeros(1, M * length(x_n_downsampled));
x_n_interpolated(1:M:end) = x_n_downsampled;

% Plot the interpolated signal in the time domain
n_interpolated = 0:1:length(x_n_interpolated)-1;  % New time index for interpolated signal
figure;
subplot(2, 1, 1);
stem(n_interpolated, x_n_interpolated);
xlabel('n');
ylabel('x[n] (Interpolated)');
title('Interpolated Signal x[n] (Zero Padding)');
grid on;

% Apply low-pass filtering to smooth the signal (using a simple FFT filter)
X_f_interpolated = fft(x_n_interpolated);
X_f_interpolated = X_f_interpolated(1:floor(end/2));  % Retain the positive frequencies
X_f_interpolated_mag = abs(X_f_interpolated);         % Magnitude of the Fourier Transform
N_interpolated = length(X_f_interpolated);
f_interpolated = (0:N_interpolated-1)/N_interpolated;  % Normalized frequency axis

% Plot the magnitude spectrum of the interpolated signal
subplot(2, 1, 2);
stem(f_interpolated, X_f_interpolated_mag, 'filled');
xlabel('Normalized Frequency');
ylabel('|X(f) (Interpolated)|');
title('Magnitude Spectrum of Interpolated Signal x[n]');
grid on;
