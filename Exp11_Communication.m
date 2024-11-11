% Signal parameters
Fs = 1000;
t = 0:1/Fs:1;
x = sin(2*pi*5*t) + sin(2*pi*10*t);

% Sampling
Fs_sampled = 50;
t_sampled = 0:1/Fs_sampled:1;
x_sampled = sin(2*pi*5*t_sampled) + sin(2*pi*10*t_sampled);

% Sinc interpolation
t_interp = t;
x_interp = zeros(size(t_interp));
for k = 1:length(t_sampled)
    x_interp = x_interp + x_sampled(k) * sinc(Fs_sampled * (t_interp - t_sampled(k)));
end

% Plot
subplot(3,1,1); plot(t, x); title('Original Signal');
subplot(3,1,2); stem(t_sampled, x_sampled); title('Sampled Signal');
subplot(3,1,3); plot(t_interp, x_interp); title('Reconstructed Signal');
