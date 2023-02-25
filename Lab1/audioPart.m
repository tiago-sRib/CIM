% Audio Part
clear
clc

[x,FS]=audioread('media\sting22.wav'); % Fs = 22.05k
% [x,FS,NBITS]=wavread('.\media\sting22.wav'); % old Matlab versions
NBITS=16;
% sound(x,FS,NBITS); % NOTA: x values are already in the range [-1, 1]
samples=0:length(x)-1;
figure(1)
plot(samples/FS, x);
xlabel('Time (s)');
ylabel('Amplitude');    
title('sting22.wav');

N = [2 4 6 8 10 12 14 16];
M = 2.^(N-1);

xq = floor(0.5 + x.*M);
xr = xq./M;
xe = x - xr;

% sound(xe(:,length(N)),FS,NBITS);

Ps = rms(x).^2;
Pr = rms(xr).^2;
Pe = rms(xe).^2;
SNR = 10*log10(Ps./Pe);

p = polyfit(N, SNR, 1); 
y = polyval(p,N);
figure(2)
plot(N,SNR, 'o')
hold on
plot(N,y)
xlabel('N')
ylabel('SNR')
title('SNR vs N in an audio file')
legend('Data','1st-order fit')
hold off

% Decimation
F = [2 4];
h = [1 1];
decimated_signal2 = downsample(x,2);
decimated_signal2 = upsample(decimated_signal2,2); 
x_filt2 = filter(h, 1, decimated_signal2); 
% sound(decimated_signal2,FS,NBITS);

decimated_signal4 = downsample(x,4);
decimated_signal4 = upsample(decimated_signal4,4); 
x_filt4 = filter(h, 1, decimated_signal4);
% sound(decimated_signal4,FS,NBITS);




