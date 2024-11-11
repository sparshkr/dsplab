n = 0:29;
x1 = cos(2*pi*n/10);
x2 = [x1 x1];
x3 = [x1 x1 x1 x1 x1 x1] ;

X1 = abs(fft(x1));
subplot(3,1,1);
plot((0:length(X1)-1)/length(X1),X1);

X2= abs(fft(x2));
subplot(3,1,2);
plot((0:length(X2)-1)/length(X2),X2);

X3 = abs(fft(x3));
subplot(3,1,3);
plot((0:length(X3)-1)/length(X3),X3);