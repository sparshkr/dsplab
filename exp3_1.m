% Parameters
f = 60;                   % Frequency of the cosine signal (Hz)
tmin = -0.05;             % Start time (seconds)
tmax = 0.05;              % End time (seconds)
fs = 800;                 % Sampling frequency (Hz)
Ts = 1/fs;                % Sampling interval (seconds)

% Continuous time vector and signal
t = linspace(tmin, tmax, 400); % High-resolution time vector for original signal
x_c = cos(2 * pi * f * t);     % Continuous cosine signal

% Sampled time vector and signal
nmin = ceil(tmin / Ts);
nmax = floor(tmax / Ts);
n = nmin:nmax;        % Time vector for sampled signal
x_sampled = cos(2 * pi * f * n*Ts);  % Sampled cosine signal

% Plot the continuous and sampled signals
figure;
plot(t, x_c, 'b');                 % Plot continuous signal in blue
hold on;
      
stem(n*Ts, x_sampled, '.');   % Plot sampled signal in red
plot(n*Ts, x_sampled);
title('Continuous and Sampled Signals');
xlabel('Time (s)');
ylabel('Amplitude');

grid on;
hold off;
