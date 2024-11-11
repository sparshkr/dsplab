Fs = 10000; %in Hz
t = 0:1/Fs:1;
f = 5;
A = 1;

% Original Signal
sine_wave = A * sin(2 * pi * f * t);

desired_variance = 0.05;

% Noise Signal
noise = sqrt(desired_variance) * randn(size(t));

% Noisy Signal
noisy_signal = sine_wave + noise;

figure;
subplot(5,1,1);
plot(t, sine_wave);
title('Original Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5,1,2);
plot(t, noise);
title('Noise');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5,1,3);
plot(t, noisy_signal);
title(['Sine Wave with Gaussian Noise (Variance = ', num2str(desired_variance), ')']);
xlabel('Time (s)');
ylabel('Amplitude');


% LMS parameters
mu = 0.008;  % Step size 
n = length(noisy_signal);  % Number of samples
order = 15;  % Number of Taps

W = zeros(order, 1);  %  filter weights
X = zeros(order, 1);  



Error = zeros(1,n);

filtered_signal = zeros(1, n);  % To store the filtered signal

% LMS Algorithm
for i = order:n
    X = noisy_signal(i:-1:i-order+1)';  % window of noisy signal
    y = W' * X; 
    e = sine_wave(i) - y;  
    Error(i) = e;
    W = W + mu * e * X;  
    filtered_signal(i) = y;  
end

subplot(5,1,4);
plot(t, filtered_signal);
title('Filtered Signal (LMS Output)');
xlabel('Time (s)');
ylabel('Amplitude');

%Error = Error

sub plot(5,1,5);
plot(t,Error);
title('Error');
xlabel('Time (s)');
ylabel('Amplitude');


