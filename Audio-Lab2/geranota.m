% nota
function amostras = geranota(nota, duracao, Fs)
    % Sintetização dos primeiros 5 termos
    T0 = 1.0/(440.0*nota);
    t = 0:1/Fs:duracao;
    A = 5000;

    amostras = zeros(size(t));
    if nota == 0
        return;
    end
    
    for k = 1:5
        amostras = amostras - (2*A/(pi*k))*sin((2*pi/T0)*k*t);
    end
    
    % Calcula o tamanho do fade in e fade out
    fade_len = floor(length(amostras) / 10);
   
    % Generate sine wave
    sine_period = 4*fade_len;
    sineWave = sin(linspace(0, 2*pi, sine_period))';
    
    % Apply sine wave to audio signal
    amostras(1:fade_len) = amostras(1:fade_len) .* sineWave(1:fade_len)';
    amostras(end-fade_len:end) = amostras(end-fade_len:end) .* sineWave(fade_len:2*fade_len)';

    amostras = amostras/max(abs(amostras));
    % plot(t, amostras);
end
