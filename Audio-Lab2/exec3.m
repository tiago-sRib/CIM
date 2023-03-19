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

sound(melody, Fs);
audiowrite('audio\melody.wav', melody, Fs);

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