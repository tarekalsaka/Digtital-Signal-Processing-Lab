f = 5; fs = 50;
t = 0: 1/fs : 1;
xn = sin(2*pi*f*t);
xc = cos(2*pi*f*t);

N = length(xn);
fr = (-N/2 : N/2-1)*fs/N;

Nc = length(xc);
frc = (-Nc/2 : Nc/2-1)*fs/Nc;

xfn = fftshift(fft(xn));
xfc = fftshift(fft(xc));

figure; % sin
subplot(221); plot(t, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xfn)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xfn)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xfn)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

figure; % cos
subplot(221); plot(t, xc); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(frc, abs(xfc)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(frc, real(xfc)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(frc, imag(xfc)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');


sq = square(2*pi*f*t);
Nsquare = length(sq);
fsq = (-Nsquare/2 : Nsquare/2-1)*fs/Nsquare;
fsqr = fftshift(fft(sq));

figure;
subplot(221); plot(t, sq); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fsq, abs(fsqr)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fsq, real(fsqr)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fsq, imag(fsqr)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

xr = randn(10000,1); % Gaussian noise
Nr = length(xr);
f_r = (-Nr/2 : Nr/2-1)*fs/Nr;
xfr = fftshift(fft(xr));

figure;
subplot(221); plot( xr); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(f_r, abs(xfr)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(f_r, real(xfr)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(f_r, imag(xfr)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');


%% Ex. 2

f1 = 5;
f2 = 20;
fs = [10 20 25 40 50 100 150]; % sampling frequency


for i = 1:length(fs)
    n = 0: (1/fs(i)): 1 ;% using different sampling frequency , values from fs = [10 20 25 40 50 100 150];

    xn = 3*cos(2*pi*f1*n) + 3*cos(2*pi*f2*n); 
    figure;
    plot(n, xn);
    
    N =1000;
    f = (-N/2 : N/2-1)*fs(i)/N;
    xf = fftshift(fft(xn, 1000)); % domain 
    
    figure;
    subplot(221); plot(n, xn); title('Signal'); xlabel('Time(sec)'); ylabel('Amplitude');
    subplot(222); plot(f, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
    subplot(223); plot(f, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
    subplot(224); plot(f, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');    
end
% Aliasing effect:
% if the fs is lower than nyquest frequency, the aliasing effect is obvious,
% i.e the 2 signals are shown as almost one sinusoidal signal
% When fs is bigger than Nyquest frequency, there is no aliasing, and the
% addition of 2 sinusoids with different frequencies is obvious. 

%% Ex. 3

originalfolder = pwd;
cd('images/1D-DFT');

im = imread('tifImage_001.tif');
%normImage = mat2gray(im);
im = im(:,:,1);
normImage = im2double(im);
im2 = imresize(normImage, [66 131]);
[x,y,z] = size(im2);

prof = im2(33,:);

range = 1:1:y;
imref = fftshift(fft(prof, 1000));
%figure; plot(abs(imref));

imagefiles = dir('*.tif');      
nfiles = length(imagefiles);    % Number of files found

for i=1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   currentimage = currentimage(:,:,1);
   normImage = im2double(currentimage);
   currentimage = imresize(currentimage, [66 131]);
   images{i} = currentimage;
   prof2 = currentimage(33,:);
   imref2 = fftshift(fft(prof2, 1000));
   
   err = immse(imref,imref2);
   meansquareerror(i) = err;
end

%size(images)
cd(originalfolder);


i=1:nfiles;
figure; plot(i, meansquareerror); title('plotting mean square errors between ffts');

% We can choose a threshold for the mean-square errors, for example I will
% choose 3 to be the threshold, so that any value < this will be treated as
% barcode, otherwise it is non-barcode 
barcode = [];
non_barcode = [];
nn = 1;
mm = 1;
thresh = 3.0*10^6;

for j = 1:nfiles
    
    if meansquareerror(j) < thresh
        barcode(nn) = j;
        nn = nn + 1;
    else
        non_barcode(mm) = j;
        mm = mm + 1;  
    end
end

for i = 1: length(barcode)
fprintf('barcode elements are numbers: %d \n ', barcode(i));
end

for i = 1: length(non_barcode)
fprintf('non_barcode elements are numbers: %d \n', non_barcode(i));
end

% From our plot and the results, we see that this system is easily fooled
% by images has vertical lines similar to barcodes. 


