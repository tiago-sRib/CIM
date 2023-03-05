clc
clear

% duracao = 0.3;
Fs = 22050;

pauta = ["do" "re" 'mi' 'fa' 'fa' 'fa' 'do' 're' 'do' 're' 're' 're' 'do' 'sol' 'fa' 'mi' 'mi' 'mi' 'do' 're' 'mi' "fa"];
melody = [];

for i = 1:length(pauta)
    nota = convertenota(pauta(i));
    waveform = geranota(nota, 0.3, Fs);
    melody = [melody waveform];
end

sound(melody, Fs)
audiowrite('melody.wav', melody, Fs);

function nota_R = convertenota(nota)
    R = 2^(1/12);
    
    switch nota
        case 'do'
            nota_R = R^(-9);
        case 'do#'
            nota_R = R^(-8);
        case 're'
            nota_R = R^(-7);
        case 're#'
            nota_R = R^(-6);
        case 'mi'
            nota_R = R^(-5);
        case 'fa'
            nota_R = R^(-4);
        case 'fa#'
            nota_R = R^(-3);
        case 'sol'
            nota_R = R^(-2);
        case 'sol#'
            nota_R = R^(-1);
        case 'la'
            nota_R = R^(0);
        case 'la#'
            nota_R = R^(1);
        case 'si'
            nota_R = R^(2);
        otherwise
            nota_R = 0;
    end

end

function amostras = geranota(nota, duracao, Fs)
    % Sintetização dos primeiros 5 termos
    T0 = 1.0/(440.0*nota);
    t = 0:1/Fs:duracao;
    A = 5000;

    amostras = zeros(size(t));
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
end
