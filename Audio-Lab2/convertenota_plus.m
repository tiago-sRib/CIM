function [nota_R, duracao] = convertenota_plus(input_nota, bpm)
    R = 2^(1/12);
    
    out = regexp(input_nota, '([a-z#]+)(\d+)-(\d+)', 'tokens');
    nota = out{1}{1};
    escala = str2double(out{1}{2})-4;
    intervalo = str2double(string(out{1}{3}));
    duracao = (60/bpm) * (4/intervalo);
    
    switch nota
        case 'do'
            nota_R = R^(-9 + 12*escala);
        case 'do#'
            nota_R = R^(-8 + 12*escala);
        case 're'
            nota_R = R^(-7 + 12*escala);
        case 're#'
            nota_R = R^(-6 + 12*escala);
        case 'mi'
            nota_R = R^(-5 + 12*escala);
        case 'fa'
            nota_R = R^(-4 + 12*escala);
        case 'fa#'
            nota_R = R^(-3 + 12*escala);
        case 'sol'
            nota_R = R^(-2 + 12*escala);
        case 'sol#'
            nota_R = R^(-1 + 12*escala);
        case 'la'
            nota_R = R^(0 + 12*escala);
        case 'la#'
            nota_R = R^(1 + 12*escala);
        case 'si'
            nota_R = R^(2 + 12*escala);
        case 'x'
            nota_R = 0;
        otherwise
            nota_R = 0;
    end
end