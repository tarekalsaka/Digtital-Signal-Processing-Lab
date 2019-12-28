% Exercice 1
%=============================
clc; clear all; close all;

% 1.1:
signal=Dirac(10,20);
stem(signal)
title('Dirac function')

%=============================

%1.2:
signal=Step(10,20);
figure;
stem(signal)
title('Step function')
%=============================
% 1.3:
signal=Ramp(2,10,20);
figure;
stem(signal)
title('Ramp function')
%=============================
% 1.4:
signal=Geo(2,10,20);
figure;
stem(signal)
title('Geo function')
%=============================
%1.5:
signal=Box(3,6,20);
figure;
stem(signal)
title('Box function')
%==============================
% 1.6:
signal=sinFn(10,1,100);
figure;
plot(signal)
title('1 period of a 10 Hz Sinusoid function, sampled at 100Hz')

signal=sinFn(10,2,1000);
figure;
plot(signal)
title('2 periods of a 10 Hz Sinusoid function, sampled at 1kHz')

signal=sinFn(10,2,30);
figure;
plot(signal)
title('2 periods of a 10 Hz Sinusoid function, sampled at 30Hz')
%===============================================================
%Exercice 2 { Random signals)  
%================================================================
%2.1:
%For observation xn=1000
random1=randn(1,1000);
figure;
histogram(random1,100)
title('Histogram of an observation xn=1000 from a normal/gaussian random process')
mu = 0; %Mean
sigma = 1; %Standard deviation
dist = normpdf(random1,mu,sigma);
figure;                                                                                                                                                                                                    
stem(random1,dist);
title('Theoretical distribution of a gaussian process xn=10000 with mu=0 and sigma=1')

%For observation xn=10000
random2=randn(1,10000);
figure;
histogram(random2,100)
title('Histogram of an observation xn=10000 from a normal/gaussian random process')
mu = 0; %Mean
sigma = 1; %Standard deviation
dist = normpdf(random2,mu,sigma);
figure;
stem(random2,dist);
title('Theoretical distribution of a gaussian process xn=10000 with mu=0 and sigma=1')

%After comparing the graphs for the experimental and the theoretical
%distributions, we can see that for all the cases they both match pretty well,
%confirming that the generated data is rightly distributed.

%Then, after increasing the amount of samples we can see how the gaussian
%distribution is expanded a little to both sides. This is due to the amount of
%information which can be composed of values from a wider range.


%=====================================
% 2.2:
%For observation xn=1000
random3=rand(1,1000);
figure;
histogram(random3,100)
title('Histogram of an observation xn=1000 from an uniform random process')
dist = unifpdf(random3,0,1);
figure;
stem(random3,dist);
title('Theoretical distribution of an uniform process xn=1000')

%For observation xn=10000
random4=rand(1,10000);
figure;
histogram(random4,100)
title('Histogram of an observation xn=10000 from an uniform random process')
dist = unifpdf(random4,0,1);
figure;
stem(random4,dist);
title('Theoretical distribution of an uniform process xn=10000')

%For both cases the distribution is rather uniform, with a change in their intensities.

%=====================
%2.3:
figure;
[acor,lag] = xcorr(random2);
plot(lag,acor)
title('Autocorrelation of gaussian process xn=10000 with mu=0 and sigma=1')

%For the previous autocorrelation, we can see that it has a peak in the middle
%of the graph, meaning that it corresponds to a white stochastic process.

figure;
[acor2,lag2] = xcorr(random4);
plot(lag2,acor2)
title('Autocorrelation of uniform process xn=10000')

%From the previous autocorrelation we can see that there is a huge variation 
% in the intensities, leaving to conclude that it's not white noise.

%==========================
%2.4:
s1=round(rand(1,50));
s2=round(rand(1,50));
s3=round(rand(1,50));

st=[zeros(1,10) s1 zeros(1,15) s2 zeros(1,13) s3 zeros(1,10)];

figure;
plot(st);
title('Concatenation of noises s1, s2 and s3')


figure;
[acor,lag] = xcorr(st,s1);
plot(lag,acor)
title('Cross-correlation of noise s1 with the concatened signal')

figure;
[acor,lag] = xcorr(st,s2);
plot(lag,acor)
title('Cross-correlation of noise s2 with the concatened signal')

figure;
[acor,lag] = xcorr(st,s3);
plot(lag,acor)
title('Cross-correlation of noise s3 with the concatened signal')

%From the results we can conclude that the cross-correlation is a good method
%for detecting similar signal patterns, this because for every signal we can see
%a high peak in its corresponding position on the general signal.