clear all;
close all;
clc;

% Parameters
Am = 1;
Ac = 2;
fm = 5;
fc = 50;
t = 0:0.001:1;
kp = pi/4;
kf = 25;

% Message signal
message_signal = Am * sin(2*pi*fm*t);

% Carrier signal
carrier_signal = Ac * sin(2*pi*fc*t);

% AM signal
am_signal = (Ac + Am * sin(2*pi*fm*t)) .* sin(2*pi*fc*t);

% PM signal
PM_signal = Ac * sin(2*pi*fc*t + kp * message_signal);

% FM signal
FM_signal = Ac * sin(2*pi*fc*t + kf * sin(2*pi*fm*t));

% DSB-SC signal
dsbsc_signal = Am * sin(2*pi*fm*t) .* sin(2*pi*fc*t);

% Plot the results
figure;

subplot(3,2,1);
plot(t, message_signal), grid on;
title('Message signal');
xlabel('time');
ylabel('amplitude');

subplot(3,2,2);
plot(t, carrier_signal), grid on;
title('Carrier signal');
xlabel('time');
ylabel('amplitude');

subplot(3,2,3);
plot(t, am_signal), grid on;
title('AM signal');
xlabel('time');
ylabel('amplitude');

subplot(3,2,4);
plot(t, PM_signal), grid on;
title('PM signal');
xlabel('time');
ylabel('amplitude');

subplot(3,2,5);
plot(t, FM_signal), grid on;
title('FM signal');
xlabel('time');
ylabel('amplitude');

subplot(3,2,6);
plot(t, dsbsc_signal), grid on;
title('DSB-SC signal');
xlabel('time');
ylabel('amplitude');
