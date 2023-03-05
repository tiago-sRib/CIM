% Constantes
A = 5000;
T0 = 1/440;
f0 = 1/T0;
Fs = 22050;
t = 0:1/Fs:1000*T0;

% Sintetização dos primeiros 5 termos
x = zeros(size(t));
for k = 1:5
    x = x - (2*A/(pi*k))*sin((2*pi/T0)*k*t);
end

x = (x - min(x)) * 2 / (max(x) - min(x)) - 1;
sound(x,Fs);

% Plot
figure();
hold on
plot(t, x)
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Período da onda gerada')
hold off
