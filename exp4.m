clc;
clear all;

% Parameters
Ts = 0.0002; % Sampling period
Fs = 1/Ts;   % Sampling frequency
n = -25:25;  % Time index
nTs = n * Ts; % Time vector corresponding to n
x = exp(-1000 * abs(nTs)); % Original signal (exponential decay)

xx = linspace(-25,25,1000);

% Plot the original signal
figure;
stem(n, x);
xlabel('n');
ylabel('x[n]');
title('Original Signal x[n]');
grid on;

% Ideal Interpolation using Sinc function
y_sinc = zeros(size(n)); % Pre-allocate the output signal

% Interpolation using two loops
for i = 1:length(n)
    sum = 0;
    for j = 1:length(n)
        % Using MATLAB's built-in sinc function
        sum = sum + x(j) * sinc(((i) - (j))/Ts);
    end
    y_sinc(i) = sum;
end

% Plot the interpolated signal
figure;
plot(nTs, y_sinc, '-o');
xlabel('t');
ylabel('y(t)');
title('Interpolated Signal Using Sinc Function');
grid on;


y_zoh = interp1(n,x,xx,'previous');
figure;
plot(xx,y_zoh);

y_linear = interp1(n,x,xx,"linear");
figure;
plot(xx,y_linear);

y_spline = interp1(n,x,xx,'spline');
figure;
plot(xx,y_spline);
