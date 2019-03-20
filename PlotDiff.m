%PlotDiff.m
fs = 1000;T = 1/fs;
w = -1000:1000;
figure(1);clf;
alpha = 1./(1 + (w^T).^2);
beta = w*T./(1 + (w^T).^2);
plot(alpha, beta);
%Draw unit circle
theta = 0:2*pi/1024
r = ones
[x 
hold on;
plot(x, y);