% Parameters
n = 0:1:25; % Discrete time index
f1 = 0.0625; % Frequency of the first sine component
f2 = 0.2; % Frequency of the second sine component

% Generate the discrete-time signal x[n]
x_n = 0.8 * sin(2 * pi * f1 * n) + 0.3 * sin(2 * pi * f2 * n);

% Plot the time-domain signal x[n]
figure;
subplot(3, 3, 1);
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
subplot(3, 3, 2);
stem(f, X_f_mag, 'filled'); % Plot magnitude spectrum
xlabel('Normalized Frequency');
ylabel('|X(f)|');
title('Magnitude Spectrum of x[n]');
grid on;

xdown = downsample(x_n,2);
subplot(3,3,3);
stem(0:length(xdown)-1,xdown);

xdown_f = fft(xdown);
N = length(xdown_f);
subplot(3,3,4);
stem((0:N-1)/N,abs(xdown_f));

xinter = interp(xdown,2);
N = length(xinter);
subplot(3,3,5);
stem(0:N-1,xinter);

xinter_f = fft(xinter);
N = length(xinter_f);
subplot(3,3,6);
stem((0:N-1)/N,abs(xinter_f));
