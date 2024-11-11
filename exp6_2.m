
w = linspace(-pi, pi, 1000);


Xihat = sin(2.5 * w) ./ sin(w / 2) .* exp(-3 + 1j * w);
Xihatmag = abs(Xihat);
Xihatarg = angle(Xihat);


xin = [0 1 1 1 1 1 0 0]; 
k = -4:3;
Xik = fftshift(fft(xin));
Xikmag = abs(Xik);
Xikarg = angle(Xik);


figure;
plot(w, Xihatmag, '-b');
axis([-pi pi 0 6]);
hold on; % makes the next plot come out on the same graph

% Plot the centered DFT magnitude using a symbol, but no line
plot(k * 2 * pi / 8, Xikmag, 'ro'); 
hold off;

% Adding title and labels
title('Magnitude of DTFT and centered 8-pt DFT');
xlabel('\omega', 'FontSize', 14);
ylabel('$|\widehat{X}(e^{j\omega})|$, $|X[k]|$', 'Interpreter', 'latex', 'FontSize', 14);
legend('DTFT', 'DFT');
