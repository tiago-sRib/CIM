function [resultado1,resultado2] = ampliaReduz (N, factor)

% funcao editada para o exercico 2

% fun??o para ampliar ou reduzir dimensoes espaciais da imagem "zone-plate"
% Recebe as dimensoes N da imagem de teste a construir, 
% o factor de ampliacao/reducao para aplicar ? imagem de teste criada,
% e ainda um valor numerico para indicar o metodo de interpola??o a usar:
% 1: nearest neighbor; 2) bilinear; 3: bicubic
% Usa a fun??o built-in imresize(I, scale,'method') do Matlab
% Usa a fun??o "imzoneplate(N)"
% Retorna as imagens reduzidas ou ampliadas pelos dois m?todos

Z=imzoneplate(N);
fig = figure;
fig.Position = [383 218 971 624];
subplot(2,3,1), imshow(Z);
title('Original');
method = ["Nearest" "Bilinear" "Bicubic"];
imwrite(Z, fullfile('images_exec2/', sprintf("N%d_Zoriginal.jpg", N)));

f_str = sprintf('%.2f', factor);
f_str = strrep(f_str, '.', '-');

    % se se tratar de uma redu??o (factor<1) obtem a imagem apenas por
    % elimina??o de amostras e depois usa imresize

    if factor<1
        factorReducao=1/factor;
        Zreduzida = Z(1:factorReducao:end,1:factorReducao:end);
        subplot(2,3,2), imshow(Zreduzida);
        title('Eliminacao');

        imwrite(Zreduzida, fullfile('images_exec2/', sprintf("N%d_F%s_Zreduzida_.jpg", N, f_str)));
        
        % Resampling
        Zresample = downsample(Z, 1/factor);
        Zresample = downsample(Zresample', 1/factor);
        Zresample = Zresample';
        subplot(2,3,3), imshow(Zresample);
        title('Downsampling');
        imwrite(Zresample, fullfile('images_exec2/', sprintf("N%d_F%s_Zresample.jpg", N, f_str)));
        
        % agora obtem nova imagem reduzida usando imresize com todos os metodo
        for met = 1:length(method)
            ZreduzidaMatlab=imresize(Z,factor,method(met));
            subplot(2,3,(3+met)), imshow(ZreduzidaMatlab);
            title(sprintf("Met. %s", method(met)));
            
            imwrite(ZreduzidaMatlab, fullfile('images_exec2/', sprintf("N%d_F%s_%s_ZreduzidaMatlab.jpg", N, f_str, method(met))));
        end
        
        % retorna as imagens reduzidas com os dois m?todos
        resultado1=Zreduzida;
        resultado2=ZreduzidaMatlab;
        
        name = sprintf("Reduzida_N%d_F%s", N, f_str);
        fig.Name = sprintf("Reduzida_N%d_F%s", N, f_str);
    else
        % comeca por ampliar apenas por repeticao de pixels criando uma matriz
        % de zeros com as dimensoes desejadas
        Zampliada=zeros(factor*N,factor*N);   
        for i=1:1:N
            for j=1:1:N
                for k=(factor*i)-1:1:(factor*i)-1+(factor-1)
                    for l=(factor*j)-1:1:(factor*j)-1+(factor-1)
                        Zampliada(k,l)=Z(i,j);
                    end
                end
            end
        end
        
        subplot(2,3,2), imshow(Zampliada);
        title('Repeticao');
        
        imwrite(Zampliada, fullfile('images_exec2/', sprintf("N%d_F%s_Zampliada.jpg", N, f_str)));

        % Resampling
        Zresample = upsample(Z, factor);
        Zresample = upsample(Zresample', factor);
        Zresample = Zresample';
        subplot(2,3,3), imshow(Zresample);
        title('Upsampling');

        imwrite(Zresample, fullfile('images_exec2/', sprintf("N%d_F%s_Zresample.jpg", N, f_str)));
        
        % agora amplia usando imresize com o todos os 3 metodos
        for met = 1:length(method)
            ZampliadaMatlab=imresize(Z,factor,method(met));
            subplot(2,3,(3+met)), imshow(ZampliadaMatlab);
            title(sprintf("Met. %s", method(met)));
            
            imwrite(ZampliadaMatlab, fullfile('images_exec2/', sprintf("N%d_F%s_%s_ZampliadaMatlab.jpg", N, f_str, method(met))));
        end
    
        % retorna as imagens ampliadas com os dois m?todos
        resultado1=Zampliada;
        resultado2=ZampliadaMatlab;
        %supertitle = sprintf("Ampliada N=%d Fator=%.2f", N, factor);
        name = sprintf("Ampliada_N%d_F%s", N, f_str);
        fig.Name = sprintf("Ampliada_N%d_F%s", N, f_str);
    end
    saveas(fig, sprintf("plots_exec2/%s.pdf", name));
end

