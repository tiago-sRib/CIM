clear
clc

% Harold Faltermeyer - Axel F
Fs = 22050;
bpm = 120;

loop1 = ["fa4-8" "x0-8" "sol#4-8" "x0-16" "fa4-8" "fa4-16" "la#4-8" "fa4-8" "re#4-8" ...
        "fa4-8" "x0-8" "do5-8" "x0-16" "fa4-8" "fa4-16" "do#5-8" "do5-8" "sol#4-8" ...
        "fa4-8" "do5-8" "fa5-8" "fa4-16" "re#4-8" "re#4-16" "do4-8" "sol4-8" "fa4-2"...
        "x0-8" "x0-2"];

loop2 = ["do5-8" "do5-8" "x0-16" "re#5-8" "re#5-8" "re#5-16" "do5-8" "do5-8" ...
        "x0-8" "do5-8" "do5-8" "x0-8" "re#5-8" "re#5-16" "re5-8" "do5-8" "x0-4" ...
        "sol#4-8" "sol#4-8" "sol#4-8" "sol#4-16" "la#4-8" "la#4-8" "la#4-8" ...
        "x0-16" "la#4-8" "do5-8" "do5-8" "do5-8" "la#4-16" "do5-8" "do5-8" "x0-4"];

musica = [loop1 loop2 loop1];
melody = [];
for i = 1:length(musica)
    [nota, duracao] = convertenota_plus(musica(i), bpm);
    waveform = geranota(nota, duracao, Fs);
    melody = [melody waveform];
end

sound(melody, Fs)
audiowrite('audio/AxelF.wav', melody, Fs);