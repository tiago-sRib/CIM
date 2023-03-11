clc
clear
clear sound

[x, Fs]=audioread('audio\u2.wav');
% sound(x, Fs);

% Spectogram parameters
N = 256;
Window = hamming(N);
Noverlap = N/2;
freq_range = [0, Fs];

[S, f, t] = spectrogram(x, Window, Noverlap, N, Fs);

% Plot spectrogram
imagesc(t, f, 20*log10(abs(S)));
axis xy;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
xlim([0, max(t)]);
ylim(freq_range);
colorbar;

pauta = ["mi4-4" "re4-4" "x0-4" "la4-8" "si4-8" "la4-8" "si4-8"];
musica = [pauta pauta];
bpm = 90;   % Estimativa apenas

melody = [];
for i = 1:length(musica)
    [nota, duracao] = convertenota_plus(musica(i), bpm);
    waveform = geranota(nota, duracao, Fs);
    melody = [melody waveform];
end

sound(melody, Fs)
audiowrite('audio/u2_remake.wav', melody, Fs);