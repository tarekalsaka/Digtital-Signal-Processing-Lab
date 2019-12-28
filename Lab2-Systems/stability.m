% Exercise 2 - stability of systems


N=10;
%%% Q.1
f=step(4,N); % example of signal
F = prim(f); 
figure(10), plot(1:N, f, 'b*-', 1:N, F, 'r*-');
title('primite of the step function');
% the primitive operator as a system is unstable:
%  the ouput increases towards infinity while the input is bounded

%%% Q.2 impulse response of the system accumulator/primitive
s=Dirac(4,N);
S = prim(s);
figure(11), plot(1:N, s, 'b*-', 1:N, S, 'r*-');
title('impulse response of the primitve operator');
% as the time increases, the sum of the coeff of the impulse
%  resp. increases (-> inifinity): the system is not stable

%%% Q.3 stability of the system defined by x(k) + 2y(k-1) = y(k) 
x=Dirac(4,N);
y(1)=0;
for k=2:N
    y(k)=x(k)+2*y(k-1);
end
figure(12), plot(1:N, x, 'b*-', 1:N, y, 'r*-');
title('impulse response y_k=x_k+2x_{k-1}');
% sum of the |coeff| of the impulse rep. is infinite when
%  the time -> infinity (system unstable)

%%% Q.4 stability of the sysyem defined by x(k)+y(k-1)/3  = y(k)
x=Dirac(4,N);
y(1)=0;
for k=2:N
    y(k)=x(k)+y(k-1)/3;
end
figure(13), plot(1:N, x, 'b*-', 1:N, y, 'r*-');
title('impulse response y_k=x_k+x_{k-1}/3');
% sum of the |coeff| of the impulse rep. is bounded 
%  -> system stable !
































