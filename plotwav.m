%plotwav.m
%
% plotwav('wavfile');
%
%  Reads a wave file and displays two subplots, one in the time
%    domain and the other in the frequency domain, for each
%    channel.
%
function plotwav(WavName)
if(nargin ~= 1)
   disp('Error');
   disp('Usage: PlotWav(wavefilename)');
   return;
end
[u fs] = audioread(WavName);
T = 1/fs;
k = 1:length(u);
s = size(u, 2);
for i = 1:s
    figure;clf;
    subplot(2,1,1)
    x = u(:, i);
    plot(k*T,x)              %Plot x in time          
    axis([0 T*length(u) -1.5 1.5])
    xlabel('time in seconds');
    ylabel('voltage');
    title([WavName 'channel ' num2str(i)]);
    %
    U = fft(x);
    U = U/max(abs(U));
    subplot(2,1,2)
    plot(k*fs/length(u), abs(U))  %Plot U in frequency
    axis([0 fs/2 0 1]);
    xlabel('frequency in Hz');
    ylabel('gain');
end
return;