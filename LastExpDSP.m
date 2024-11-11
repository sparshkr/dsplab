fs = 1000; % Number of samples
t = (0:fs-1)'; 
signal = sin(2 * pi * 0.055 * t);


noise = randn(fs, 1);
filt = dsp.FIRFilter; 
filt.Numerator = fir1(11, 0.4); 
fnoise = filt(noise); 
d = signal + fnoise; 

coeffs = (filt.Numerator).' - 0.01; 
mu = 0.05; 

lms = dsp.LMSFilter(12, 'Method', 'Sign-Data LMS', ...
    'StepSize', mu, 'InitialConditions', coeffs);

[~, e] = lms(noise, d); 


L = 200; 
figure;
plot(0:L-1, signal(1:L), 'b', 0:L-1, e(1:L), 'r'); % Plot signal and error signal
title('Noise Cancellation by the Sign-Data LMS Algorithm');
legend('Original Signal', 'Noise-Cancelled Signal', 'Location', 'NorthEast');
xlabel('Time Index');
ylabel('Signal Values');
grid on;
