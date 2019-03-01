%StormBirdFilter.m
[y fs] = audioread('StormBird11025.wav');
%use this for siren
%fp1 = 430; fp2 = 510; rp = 0.05
%fs1 = 230; fs2 = 710; rs = 0.02
%use this high pass for robin
fst = 1500; rs = 0.001;
fp = 2300; rp = 0.02;
F = [fst fp];
A = [0 1];
Ripple = [rs rp];
%use this bandpass for the robin
% fp1 = 2500; fp2 = 3500; rp = 0.05;
% fs1 = 2300; fs2 = 3700; rs = 0.01;
% F = [fs1 fp1 fp2 fs2];
% A = [0 1 0];
%Ripple = [rs rp rs];
[N, F, M, w] = firpmord(F, A, Ripple, fs);
num = firpm(N, F, M, w);
yFFT = fft(y);
yFFT = yFFT/max(abs(yFFT));
[H f] = freqz(num, 1, L, fs);
figure(1);clf;
plot(f, abs(H));hold on
plot(f, abs(yFFT), 'k');
title('siren + filter');xlabel('frequency in Hz');ylabel('gain');
figure(2);clf;
zplane(num, 1);
title('PM filter p/z plot');
yf = filter(num, 1, y);
audiowrite('StormBirdFilter2.wav', yf, fs);
plot2wav('StormBird11025.wav', 'StormBirdFilter2.wav');
player = audioplayer(y, fs);
play(player);
pause;
player = audioplayer(yf, fs);
play(player);