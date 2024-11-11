x= [-1 2 1 2 1 1 -1 -1];
N = length (x);
n = 0:N-1;
X = fft(x);
w= 2*pi*n/N;
figure;
plot(w/pi,abs(X));

x = [-1 2 1 2 1 1-1-1];
N = length (x);
M = 1000000;
m = 0:M-1;
X = fft([x zeros(1,M-N)]);
w= 2*pi*m/M;
figure;
plot(w/pi,abs(X));

