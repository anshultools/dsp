clc;
clear all;
close all;

% Generate the same 10-bit input sequence for all line codes
n = floor(mod(rand(1,10),2));

figure;

% BP-RZ
s = 1;

for i = 1:10
    if n(i) == 0
        s = [s ones(1,5)*(-1) zeros(1,5)];
    else
        s = [s ones(1,5) zeros(1,5)];
    end
end

subplot(3,2,1);
plot(s,'LineWidth',1.5);
title('BP-RZ');
ylim([-1.2 1.2]);
grid on;

for i = 1:10
    text(i*10-5,1.1,num2str(n(i)));
end

% BP-RZ-AMI
s = 1;
h = -1;

for i = 1:10
    if n(i) == 0
        s = [s zeros(1,10)];
    else
        h = h*(-1);
        s = [s ones(1,5)*h zeros(1,5)];
    end
end

subplot(3,2,2);
plot(s,'LineWidth',1.5);
title('BP-RZ-AMI');
ylim([-1.2 1.2]);
grid on;

for i = 1:10
    text(i*10-5,1.1,num2str(n(i)));
end

% BP-NRZ-AMI
s = 1;
h = -1;

for i = 1:10
    if n(i) == 0
        s = [s zeros(1,10)];
    else
        h = h*(-1);
        s = [s ones(1,5)*h zeros(1,5)];
    end
end

subplot(3,2,3);
plot(s,'LineWidth',1.5);
title('BP-NRZ-AMI');
ylim([-1.2 1.2]);
grid on;

for i = 1:10
    text(i*10-5,1.1,num2str(n(i)));
end

% NRZ-M
s = 1;
h = -1;

for i = 1:10
    if n(i) == 0
        h = h*(-1);
        s = [s ones(1,10)*h];
    else
        s = [s ones(1,10)*h];
    end
end

subplot(3,2,4);
plot(s,'LineWidth',1.5);
title('NRZ-M');
ylim([-1.2 1.2]);
grid on;

for i = 1:10
    text(i*10-5,1.1,num2str(n(i)));
end

% NRZ-S
s = 1;
h = -1;

for i = 1:10
    if n(i) == 0
        h = h*(-1);
        s = [s ones(1,10)*h];
    else
        s = [s ones(1,10)*h];
    end
end

subplot(3,2,5);
plot(s,'LineWidth',1.5);
title('NRZ-S');
ylim([-1.2 1.2]);
grid on;

for i = 1:10
    text(i*10-5,1.1,num2str(n(i)));
end

% UP-RZ
s = 1;

for i = 1:10
    if n(i) == 0
        s = [s zeros(1,10)];
    else
        s = [s ones(1,5) zeros(1,5)];
    end
end

subplot(3,2,6);
plot(s,'LineWidth',1.5);
title('UP-RZ');
ylim([-1.2 1.2]);
grid on;

for i = 1:10
    text(i*10-5,1.1,num2str(n(i)));
end

sgtitle('ACDC LINE CODE');

% Display the input bits
disp('Input Binary Sequence:');
disp(n);
