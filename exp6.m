n = 0:7;
x = [0 1 1 1 1 1 0 0];

% Compute FFT of the signal
x1 = fft(x);
N = length(x1);

% Plot the original signal
subplot(3,3,1);
stem(n, x);
title('Original Signal x[n]');
xlabel('n');
ylabel('x[n]');

% Plot magnitude of FFT
subplot(3,3,2);
stem(n, abs(x1));
title('Magnitude of FFT');
xlabel('Frequency Index');
ylabel('|X[k]|');

% Plot phase of FFT
subplot(3,3,3);
stem(n, angle(x1));
title('Phase of FFT');
xlabel('Frequency Index');
ylabel('Phase(X[k])');

% Frequency vector for plotting magnitude on normalized frequency axis
w = 0 : 2*pi/8 : 7*2*pi/8;
subplot(3,3,4);
stem(w, abs(x1));
title('Magnitude of FFT (Normalized Frequency)');
xlabel('Frequency (rad/sample)');
ylabel('|X[k]|');

% Compute and plot the Inverse FFT
xnew = ifft(x1);
subplot(3,3,5);
stem(n, real(xnew)); % Use real part to avoid any tiny imaginary artifacts
title('Reconstructed Signal (IFFT)');
xlabel('n');
ylabel('x_{reconstructed}[n]');

% Compute and plot FFT shift (centered frequency spectrum)
x2 = fftshift(x1);
k = -N/2 : N/2 - 1;
w_shifted = k * (2*pi/N);
subplot(3,3,6);
stem(w_shifted, abs(x2));
title('Magnitude of FFT after Shift');
xlabel('Frequency (rad/sample)');
ylabel('|X_{shifted}[k]|');
