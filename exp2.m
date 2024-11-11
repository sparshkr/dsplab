% Define two sequences x and h
x = [1, 2, 3, 4];  % Example sequence x
h = [1, -1, 2];    % Example sequence h

% Lengths of the sequences
len_x = length(x);
len_h = length(h);

% Length of the result
len_y = len_x + len_h - 1;

% Initialize the output array
y = zeros(1, len_y);

% Perform convolution manually
for i = 1:len_y
    % Initialize sum for each position
    sum = 0;
    
    % Calculate the convolution sum for the current position
    for j = 1:len_h
        if (i - j + 1 > 0) && (i - j + 1 <= len_x)
            sum = sum + h(j) * x(i - j + 1);
        end
    end
    
    % Store the sum in the output array
    y(i) = sum;
end

% Display the result
disp('Convolution Result:');
disp(y);

% Plot the original sequences and the convolution result
figure;

% Plot sequence x
subplot(3, 1, 1);
stem(0:len_x-1, x, 'filled');
title('Sequence x');
xlabel('n');
ylabel('x[n]');

% Plot sequence h
subplot(3, 1, 2);
stem(0:len_h-1, h, 'filled');
title('Sequence h');
xlabel('n');
ylabel('h[n]');

% Plot convolution result y
subplot(3, 1, 3);
stem(0:len_y-1, y, 'filled');
title('Convolution Result y');
xlabel('n');
ylabel('y[n]');
