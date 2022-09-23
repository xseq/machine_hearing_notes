% This is to discuss the general filter design
% In HMH Chapters 7 and 8, the concept is introduced. Here is a Matlab
% realization of the principles.

% This example shows what it means to have two poles and two zeros and how
% that relates to frequency response.

% Here the two poles are at +/- 45 deg, and the two zeros are at +/- 90 deg
% The radius in the z plane is (1/2)^(0.5), with medium level (un)damping.
% The frequency response results are in the form of peak followed by a dip.

% The freqz function plots the frequency response. Note the format of b and
% a parameters are discussed in HMH p.129.

%
close all;
clc;
clear;

fs = 16000;
b = [1 0 0.5];
a = [1 -1 0.5];

points = 2000;
[h, f] = freqz(b, a, points, 'whole', fs);
N = points / 2;
plot(f(1:N) / fs, 20*log10(abs(h((1:N)))), 'linewidth', 2, 'color', 'k');

xlabel('Normalized Frequency (f/fs)');
ylabel('Magnitude (dB)');
grid on;

