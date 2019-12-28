% Reminder

%%% Sin(2 pi f t), f= 1 Hz
t = 0: 0.01:2 ; % Samples from 0 to 2 with 0.01 steps 
x = sin(2*pi*t); % sin(2 pi t)
figure(1)
plot(t, x, 'b'); 
xlabel('t in sec'); 
ylabel('x(t)');
title('plot sin(2\pi t)');


%%% discrete sin with sampling frequecny = 20 
n = 1:1:40; % sample index from 0 t0 20 
x = sin(0.1*pi*n); 
Hs = stem (n, x, 'b');
xlabel('n') ; ylabel('x(n)');
title('Stem plot if the sin(0.2 pi n)');