% Matthew Horton
% EE311 Assignment 3
% February 11, 2018

function plotwav(WavName)
if(nargin ~= 1)
   disp('Error');
   disp('Usage: PlotWav(wavefilename)');
   return;
end


[u fs] = audioread(WavName);

% 1. sum channels and normalize to 1
u = sum(u, 2);
u = u ./ 2;


% 2. get index of max value and its index
[M,I] = max(abs(u))

% 3. get only values less than 90% max and greater than 110% max
approachData = u(1:(0.9*I));
leavingData = u((1.1*I):end);

% 4. make arrival and departure lengths same
approachData = approachData((length(approachData)+1)-length(leavingData):end);

T = 1/fs;
k = 1:length(u);
%s = size(u, 4);
figure;clf;
    
subplot(4,1,1)
x = u;
plot(k*T,x)              %Plot x in time          
title('Subplot 1: original signal')
axis([0 T*length(u) -1.0 1.0])
xlabel('time in seconds');
ylabel('voltage');
%
subplot(4,1,2)
plot((1:length(approachData))*T, approachData)
title('Subplot 2: approachData')
axis([0 T*length(approachData) -1.0 1.0])
xlabel('time in seconds');
ylabel('voltage');
%
subplot(4,1,3)
plot((1:length(leavingData))*T, leavingData)
title('Subplot 2: leavingData')
axis([0 T*length(leavingData) -1.0 1.0])
xlabel('time in seconds');
ylabel('voltage');
%
a = fft(approachData);
l = fft(leavingData);
subplot(4,1,4)
plot((1:length(approachData))*T,
                              a,
      (1:length(leavingData))*T,
                              l)
title('Subplot 4: fft''s of approaching and leaving data')
axis([0 T*length(approachData) -1.0 1.0])
xlabel('time in seconds');
ylabel('?');
%


return;