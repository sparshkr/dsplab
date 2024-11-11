% Parameters
n = 0:1:25; % Discrete time index
f1 = 0.0625; % Frequency of the first sine component
f2 = 0.2; % Frequency of the second sine component

% Generate the discrete-time signal x[n]
x_n = 0.8 * sin(2 * pi * f1 * n) + 0.3 * sin(2 * pi * f2 * n);

% Plot the time-domain signal x[n]
figure;
subplot(3, 1, 1);
stem(n, x_n);
xlabel('n');
ylabel('x[n]');
title('Discrete-Time Signal x[n]');
grid on;

% Compute the Fourier Transform to get the spectrum
X_f = fft(x_n); % Fourier Transform of x[n]
X_f_mag = abs(X_f); % Magnitude of the Fourier Transform
N = length(X_f); % Length of the FFT
f = (0:N-1)/N; % Normalized frequency axis

% Plot the magnitude spectrum of x[n]
subplot(3, 1, 2);
stem(f, X_f_mag, 'filled'); % Plot magnitude spectrum
xlabel('Normalized Frequency');
ylabel('|X(f)|');
title('Magnitude Spectrum of x[n]');
grid on;

% Downsample the signal by a factor of 2
x_n_downsampled = x_n(1:2:end); % Take every second sample
n_downsampled = 0:2:length(x_n)-1; % Correct time indices for downsampled signal

% Plot the downsampled signal
subplot(3, 1, 3);
stem(n_downsampled, x_n_downsampled);
xlabel('n');
ylabel('x[n] (Downsampled)');
title('Downsampled Signal x[n]');
grid on;

% Compute the Fourier Transform of the downsampled signal
X_f_downsampled = fft(x_n_downsampled);
X_f_mag_downsampled = abs(X_f_downsampled);
N_downsampled = length(X_f_downsampled);
f_downsampled = (0:N_downsampled-1)/N_downsampled;

% Plot the magnitude spectrum of the downsampled signal
figure;
stem(f_downsampled, X_f_mag_downsampled, 'filled');
xlabel('Normalized Frequency');
ylabel('|X(f) (Downsampled)|');
title('Magnitude Spectrum of Downsampled Signal x[n]');
grid on;

% Correct interpolation
figure;

% Original downsampled points
stem(n_downsampled, x_n_downsampled, 'r', 'filled');
hold on;

% Create interpolation points
xx = linspace(0,25,1000);  % More points for smoother interpolation
yy = interp1(n_downsampled, x_n_downsampled, xx, 'spline');

% Plot interpolated signal
plot(xx, yy, 'b-', 'LineWidth', 1.5);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('Downsampled Signal with Spline Interpolation');

hold off;