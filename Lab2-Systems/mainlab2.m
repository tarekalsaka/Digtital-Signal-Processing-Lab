clear all;
close all;

% Exercice 1 – Causality
%=========================================
%1.1:
N=10;
for i=1:N
	if i<4 x(i)=0;
	else x(i)=1;
	end
end
for i=1:N
	if i<N
		y(i)=(x(i)+x(i+1))/2;
	else 
		y(i)=x(i)/2;
	end
end
figure;
stem(y);
title('Causal system');

%In order to have a casual system, it should depend only in present and past values, such  that:

for i=1:N
	if i>1
		y2(i)=(x(i-1)+x(i))/2;
	else 
		y2(i)=x(i)/2;
	end
end
figure;
stem(y2);
title('Non-causal system');

%==========================================================
% Exercise 2 Stability:

%2.1 Primitive operator:
N=10;
for i=1:N
		y3(i)=x(i);
end
figure;
stem(y3);
title('Primitive operator');

%The primitive operator is stable as it reaches and remains on a certain value.

%2.2 The impulse response of the primitive operator is a dirac of size 1.

for i=1:N
	if i>1
		y4(i)=x(i)+2*y4(i-1);
	else 
		y4(i)=x(i);
	end
end
figure;
stem(y4);
title('Non-stable system');
%The system is not stable as it doesn-t reach a steady-stsate value.

%2.3mpulse response:
for i=1:N
	if i~=5 xdirac(i)=0;
	else xdirac(i)=1;
	end
end
for i=1:N
	if i>1
		y5(i)=xdirac(i)+2*y5(i-1);
	else 
		y5(i)=xdirac(i);
	end
end
figure;
stem(y5);
title('Impulse response for non-stable system 1');

%2.4 Impulse response:
for i=1:N
	if i>1
		y6(i)=xdirac(i)+y6(i-1)/3;
	else 
		y6(i)=xdirac(i);
	end
end
figure;
stem(y6);
title('Impulse response for non-stable system 2');
%The system is not stable as it doesn-t reach a steady-stsate value.


%===============================================================
%Exercise 3 (Invariance and linearity)

%3.1/2/3
xa=[0 0 0 0 1 2 3 4 5 0 0 0 0 0 0 0 0 0 0];
xb=[0 0 0 0 0 0 0 0 0 4 3 2 1 0 0 0 0 0 0];
for i=1:19
	if i>1 && i<19
		ya(i)=3*xa(i-1)-2*xa(i)+xa(i+1);
	elseif i==19
		ya(i)=3*xa(i-1)-2*xa(i);
	elseif i==1
		ya(i)=2*xa(i)+xa(i+1);
	end
end
figure;
stem(ya);
title('System 3.1 with first set of imputs');

for i=1:19
	if i>1 && i<19
		yb(i)=3*xb(i-1)-2*xb(i)+xb(i+1);
	elseif i==19
		yb(i)=3*xb(i-1)-2*xb(i);
	elseif i==1
		yb(i)=2*xb(i)+xb(i+1);
	end
end
figure;
stem(yb);
title('System 3.1 with second set of imputs');

%We can say this is a linear system for the following reasons:
% 1) The system doesn't take infinite values at infinite time (it
% stabilizes at 0)
% 2) The system doesn't go into uncontrollable oscillations
% 3) It's also invariant because it's equation doesn't include any
% multiplication by time.

%A non-linear time-variant system could be something like:
%   y(k) = (x(k)*t + y(k-1))^2



for i=1:19
    if i>1
        yc(i)=(xa(i)*i + yc(i-1))^2;
    else
        yc(i)=(xa(i)*i)^2;
    end
end
figure;
stem(yc);
title('Example of non-linear time-variant system');