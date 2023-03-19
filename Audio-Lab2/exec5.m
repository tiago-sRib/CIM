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

% Plot spectrogram of original signal
figure;
imagesc(t, f, 20*log10(abs(S)));
axis xy;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
xlim([0, max(t)]);
ylim(freq_range);
title('Spectrogram of Original Signal');
colorbar;

pauta = ["si5-4" "la5-4" "x0-4" "mi6-4" "fa#6-8" "mi6-8" "fa#6-8"];

musica = [pauta pauta];
bpm = 90;   % Estimativa apenas

melody = [];
for i = 1:length(musica)
    [nota, duracao] = convertenota_plus(musica(i), bpm);
    waveform = geranota(nota, duracao, Fs);
    melody = [melody waveform];
end

sound(melody, Fs);
audiowrite('audio/u2_remake.wav', melody, Fs);

[S, f, t] = spectrogram(melody, Window, Noverlap, N, Fs);

% Plot spectrogram of recreated signal
figure;
imagesc(t, f, 20*log10(abs(S)));
axis xy;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
xlim([0, max(t)]);
ylim(freq_range);
title('Spectrogram of the recreated Signal');
colorbar;