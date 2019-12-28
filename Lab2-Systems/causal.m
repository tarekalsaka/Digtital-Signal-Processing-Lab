% Exercise 1 - Causality
%%% Q.1
N=10;
x = step(4,N);
figure(10), stem(1:N, x,'*-');
title('step function');

for q=1:N-1
    y(q)=(x(q)+x(q+1))/2;
end

figure(11), plot(1:N-1, y, '*-');
title('response y_k=x_k+x_{k+1}');
% the response starts before the input
%  -> non-causal system

% ---- causal version ----
%%% Q.2 
for q=2:N
    y2(q)=(x(q-1)+x(q))/2;
end
figure(12), plot(2:N, y2(2:N), '*-');
title('response y_k=x_{k-1}+x_{k}');
% the response begins at the same time 
%     that the input -> causal


