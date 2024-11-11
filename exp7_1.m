% for sine awve
fs = 150;
t = 0:1/fs:1;
f =5;
x = sin(2*pi*f*t);
N = 1024;
X = fft(x,N);
X = X(1:N/2);
mx = abs(X);
f = (0:N/2-1)*fs/N;

figure(1);
plot(t,x);
title('Sine wave');
xlabel('time(s)');
ylabel('Amplitude');
figure(2);
plot(f,mx);
title('power spectrum for sine wave');
xlabel('freq(Hz)');
ylabel('power');

%for rect signal
fs = 150;
t = -0.5:1/fs:0.5;
w=0.2;
x = rectpuls(t,w);
N = 1024;
X = fft(x,N);
X = X(1:N/2);
mx = abs(X);
f = (0:N/2-1)*fs/N;

figure(3);
plot(t,x);
title('rect');
xlabel('time(s)');
ylabel('Amplitude');
figure(4);
plot(f,mx);
title('power spectrum for rect');
xlabel('freq(Hz)');
ylabel('power');

%for square signal
fs = 150;
t = 0:1/fs:1;
f =5;
x = square(2*pi*f*t);
N = 1024;
X = fft(x,N);
X = X(1:N/2);
mx = abs(X);
f = (0:N/2-1)*fs/N;

figure(5);
plot(t,x);
title('square');
xlabel('time(s)');
ylabel('Amplitude');
figure(6);
plot(f,mx);
title('power spectrum for square');
xlabel('freq(Hz)');
ylabel('power');

%for chirp signal
fs = 200;
t = 0:1/fs:1;
x = chirp(t,0,1,fs/6);
N = 1024;
X = fft(x,N);
X = X(1:N/2);
mx = abs(X);
f = (0:N/2-1)*fs/N;

figure(7);
plot(t,x);
title('Chirp');
xlabel('time(s)');
ylabel('Amplitude');
figure(8);
plot(f,mx);
title('power spectrum for chirp');
xlabel('freq(Hz)');
ylabel('power');


%for exponential signal

fs = 150;
t = 0:1/fs:1;
x = 2*exp(-5*t);
N = 1024;
X = fft(x,N);
X = X(1:N/2);
mx = abs(X);
f = (0:N/2-1)*fs/N;

figure(9);
plot(t,x);
title('Exponential');
xlabel('time(s)');
ylabel('Amplitude');
figure(10);
plot(f,mx);
title('power spectrum for exponential ');
xlabel('freq(Hz)');
ylabel('power');


fs = 60;
t = -0.5 : 1/fs : 0.5;
 x = 1/(sqrt(2*pi*0.01))*(exp(-t.^2/(2*0.01)));
 N = 1024;
X = fft(x,N);
X = X(1:N/2);
mx = abs(X);
f = (0:N/2-1)*fs/N;

figure(11);
plot(t,x);
title('');
xlabel('time(s)');
ylabel('Amplitude');
figure(12);
plot(f,mx);
title('power spectrum');
xlabel('freq(Hz)');
ylabel('power');