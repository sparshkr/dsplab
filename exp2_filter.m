% Time vector
t = 0:0.01:10;

% Frequency of the sinusoidal signal
f = 1;

% Original signal
y = 10 * sin(2 * pi * f * t);

% Adding random noise to the signal
e = randn(size(t));
y2 = y + e;

% Apply moving average filter with a window size of 5
M = 5;
y3 = avgfilter(y2, M);

% Plot the original, corrupted, and filtered signals
subplot(3, 1, 1);
plot(t, y);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, y2);
title('Corrupted Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, y3);
title('Filtered Signal (Moving Average)');
xlabel('Time (s)');
ylabel('Amplitude');

% Moving Average Filter Function
function y = avgfilter(c, M)
    % Define the moving average filter coefficients
    b = (1/M) * ones(1, M);
    a = 1;
    
    % Apply the filter
    y = filter(b, a, c);
end
