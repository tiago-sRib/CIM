% Sine Wave Part
clear
clc

samples=0:1E5-1;
x=sin(0.22*samples);

x = transpose(x);
N = 2:1:14;
M = 2.^(N-1);

xq = floor(0.5 + x.*M);
xr = xq./M;
xe = xr - x;

Ps = rms(x).^2;
Pr = rms(xr).^2;
Pe = rms(xe).^2;    
SNR = 10*log10(Ps./Pe);

p = polyfit(N, SNR(1:length(N)), 1);
y = polyval(p,N(1:length(N)));

figure;
plot(N,SNR(1:length(N)), 'o')
hold on
plot(N,y)
xlabel('N')
ylabel('SNR')
title('SNR vs N for a Sine Wave signal')
legend('Data','1st-order fit')
hold off

corr = zeros(1,length(N));
for i = 1:13
    aux = corrcoef(x, xe(:,i));
    corr(i) = aux(1,2);
end

figure; 
plot(N(1:length(N)), corr(1:length(N)), 'o')
hold on
plot(N(1:length(N)), corr(1:length(N)))
xlabel('N')
ylabel('CorrCoef')
title('Corrcoef vs N for a sine wave signal')
legend('Data','Fit')
hold off

% Original sine wave
figure;
[H X]=hist(x,50);
equalize=50/(max(x)-min(x));
bar(X, H/sum(H)*equalize, 0.5);
ylabel('PDF');
xlabel('x[n] amplitude');
title('Histogram of original sinusoid');

% Quantized sine wave
for i = 1:length(N)
    figure;
    [He Xe]=hist(xe(:,i),50);
    equalize=50/(max(xe(:,i))-min(xe(:,i)));
    bar(Xe, He/sum(He)*equalize, 0.5);
    ylabel('PDF');
    xlabel('x[n] amplitude');
    title(['Histograma do erro de quantização para N=' num2str(N(i))]);
end