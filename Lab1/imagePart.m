% Image Part
clear
clc

% reads and displays image
A=imread('media\lena512.bmp');
% figure(3)
% imshow(A,[0 255]); % displays original image
A=single(A)/255.0; % convert to float and normalizes [0, 1.0]
% title('lena512.bmp');

N = [2 3 4 5 6 7 8];
Ps = zeros(1,length(N));
Pe = zeros(1,length(N));
Pr = zeros(1,length(N));
SNR = zeros(1,length(N));

for i = 1:length(N)
    M = 2^N(i);
    Aq = floor(0.5 + M*A);
    Ar = Aq/M;
    Ae = A - Ar;
    
    % scale image to plot
    Ar=uint8(Ar*255.0);
    Ae=uint8(Ae*255.0);
    figure;
    imshow(Ar, [0 255]);
    title(['Ar N = ' num2str(N(i))]);

    figure;
    imshow(Ae, [0 255]);
    title(['Ae N = ' num2str(Nimg(i))]);
    
    % Normalize image to calculate power
    Ae=single(Ae)/255.0;

    Ps(i) = mean(A(:).^2);
    Pr(i) = mean(Ar(:).^2);
    Pe(i) = mean(Ae(:).^2);
    SNR(i) = 10*log10(Ps(i)/Pe(i));
end

Nplot = N(1:length(N)-1);
p = polyfit(Nplot, SNR(1:length(Nplot)), 1);
y = polyval(p,N(1:length(Nplot)));
% the obtained slope of p_img = 5.7 aprox to 6

figure;
plot(Nplot,SNR(1:length(Nplot)), 'o')
hold on
plot(Nplot,y)
xlabel('N')
ylabel('SNR')
title('SNR vs N in an image')
legend('Data','1st-order fit')
hold off

% Decimation
h2 = [1 1];
h4 = [1 1; 1 1; 1 1; 1 1];

down2 = downsample(A,2);
up2 = upsample(down2,2); 
A_filt2 = filter2(h2, up2);

down2 = uint8(down2*255.0);
figure;
imshow(down2, [0 255]);
title('Downsample image F=2');

up2 = uint8(up2*255.0);
figure;
imshow(up2, [0 255]);
title('Upsample image F=2');

A_filt2 = uint8(A_filt2*255.0);
figure;
imshow(A_filt2, [0 255]);
title('Image filter 2');

down4 = downsample(A,4);
up4 = upsample(down4,4); 
A_filt4 = filter2(h4, up4);