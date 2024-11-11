f = 60; % Hz
tmin = -0.05;
tmax = 0.05;

t = linspace(tmin, tmax, 400);
x_c = cos(2*pi*f * t);
figure('Name','Plot');
subplot(4,1,1);
plot(t,x_c)
xlabel('t (seconds)')
title('Sample with a sampling frequency of 800 Hz.')

T = 1/800;
nmin = ceil(tmin / T);
nmax = floor(tmax / T);
n = nmin:nmax;
x1 = cos(2*pi*f * n*T);
hold on;
stem(n*T,x1,'.')
plot(n*T,x1);
hold off;

subplot(4,1,2);
plot(t,x_c)
xlabel('t (seconds)')
title('Sample with a sampling frequency of 400 Hz.')

T = 1/400;
nmin = ceil(tmin / T);
nmax = floor(tmax / T);
n = nmin:nmax;
x1 = cos(2*pi*f * n*T);
hold on;
stem(n*T,x1,'.')
plot(n*T,x1);
hold off;
subplot(4,1,3);
plot(t,x_c)
xlabel('t (seconds)')
title('Sample with a sampling frequency of 120 Hz.')

T = 1/120;
nmin = ceil(tmin / T);
nmax = floor(tmax / T);
n = nmin:nmax;
x1 = cos(2*pi*f * n*T);
hold on;
stem(n*T,x1,'.')
plot(n*T,x1);
hold off;

subplot(4,1,4);
plot(t,x_c)
xlabel('t (seconds)')
title('Sample with a sampling frequency of 70 Hz.')

T = 1/70;
nmin = ceil(tmin / T);
nmax = floor(tmax / T);
n = nmin:nmax;
x1 = cos(2*pi*f * n*T);
hold on;
stem(n*T,x1,'.')
plot(n*T,x1);

hold off;