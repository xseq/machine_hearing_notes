% play with filter design

clc;clear;

% setting parameters
fs=1e4;
b=[1 0 0 0 0 0 -1];
a=[0 0 0 0 0 0 1];

% filter design
[h,f] = freqz(b,a,2001,'whole',fs);
N=round(0.5*length(h));

% plot
plot(f(1:N)/fs,20*log10(abs(h((1:N)))),'linewidth',2,'color','k');
ax = gca;
ax.YLim = [-60 10];
ax.XTick = 0:.1:0.5;
xlabel('Normalized Frequency (f/fs)');
ylabel('Magnitude (dB)');
grid on;
title('Frequency Response')


