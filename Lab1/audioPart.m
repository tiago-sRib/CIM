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

N = [2 4 6 8 10 12 14]; % N = 16 was skiped in order to be able
M = 2.^(N-1);           % to perform  polyfit

xq = floor(0.5 + x.*M);
xr = xq./M;
xe = x - xr;

for i = 1:length(N)
    audiowrite(sprintf("sounds/xr/N%d.wav", N(i)), xr(:, i), FS);
    audiowrite(sprintf("sounds/xe/N%d.wav", N(i)), xe(:, i), FS);
end

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
 
% down2 = downsample(x,2);
% up2 = upsample(down2,2); 
% x_filt2 = filter(h, 1, up2);
% audiowrite("sounds\decimated\down2.wav", down2, FS);
% audiowrite("sounds\decimated\up2.wav", up2, FS);
% audiowrite("sounds\decimated\x_filt2.wav", x_filt2, FS);

down4 = downsample(x,4);
up4 = upsample(down4,4); 
x_filt4 = filter(h, 1, up4);
audiowrite("sounds\decimated\down4.wav", down4, FS);
audiowrite("sounds\decimated\up4.wav", up4, FS);
audiowrite("sounds\decimated\x_filt4.wav", x_filt4, FS);




