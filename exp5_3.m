n1 = 0:0.01:1-0.01;
fm = 1;
y1 = sin(2*pi*fm*n1);

subplot(4,1,1);
stem(n1, y1);
title('Original Signal (sin)');

% FFT of y1
y1f = fft(y1);
N1 = length(y1f);
f1 = (0:N1-1)/N1; % Frequency axis scaling
subplot(4,1,2);
stem(f1, abs(y1f));
title('FFT of y1');

% Second signal with finer sampling
n2 = 0:0.001:1-0.001;
y2 = sin(2*pi*fm*n2);

subplot(4,1,3);
stem(n2, y2);
title('Original Signal (y2)');

% FFT of y2
y2f = fft(y2);
N2 = length(y2f);
f2 = (0:N2-1)/N2; % Frequency axis scaling
subplot(4,1,4);
stem(f2, abs(y2f));
title('FFT of y2');
