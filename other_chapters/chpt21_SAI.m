
% Understanding autocorrelation with Matlab built-in function
[y, fs] = audioread('1kHz3s.wav');
y = y(1 : round(0.01*fs), 1);
% acf = xcorr(y);
% plot(acf)

% Understanding autocorrelation with my own xcorr function
acf = get_xcorr(y, y);
plot(acf)





% 
% 
% % Cauculating and plotting HMH fig. 5.4: STFT
% clear; clc;
% [y, fs] = audioread('dream.wav');   % or any speech wav file
% [n_samples, ~] = size(y);
% hamming_time = 80; % ms
% hamming_len = round(fs * hamming_time / 1000); % hamming window length
% w = hamming(hamming_len);
% 
% 
% % windowing
% hop_time = 20;  % ms
% hop_sample = round(fs * hop_time / 1000);
% n_frames = floor((n_samples - hamming_len) / hop_sample);
% 
% 
% % STFT
% fft_len = floor(hamming_len/2);
% stft_stack = zeros(n_frames, fft_len);
% for p = 1 : n_frames
%     i_start = (p-1)*hop_sample+1;
%     frame_data = y(i_start : i_start+hamming_len-1, 1);
%     windowed_data = frame_data .* w;
%     frame_spectrum = fft(windowed_data);
%     stft_stack(p, :) = frame_spectrum(1:fft_len);
% end
% stft_stack = stft_stack';
% 
% 
% % Take magnitude and log
% stft_abs = abs(stft_stack);
% stft_log = 20 * log10(stft_abs);
% 
% 
% % magnitude gray scale plot
% maxv = median(stft_log);
% mapped_array = uint8((double(stft_log) ./ maxv) .* 255);
% mapped_array = flip(mapped_array, 1);
% figure;
% % subplot(1, 3, 1)
% % image(mapped_array);
% % colormap(gray(255));
% 
% % Frequency smoothing
% smooth_stft_abs = stft_abs;
% for p = 1:n_frames
%     for q = 2:fft_len-1
%         weights = [0.3, 0.4, 0.3];  % HMH figure 5.4
%         stft_section = smooth_stft_abs(q-1 : q+1, p);
%         smooth_stft_abs(q, p) = weights * stft_section;
%     end
% end
% smooth_stft_log = 20 * log10(smooth_stft_abs);
% smooth_maxv = median(smooth_stft_log);
% smooth_mapped_array = uint8((double(smooth_stft_log) ./ smooth_maxv) .* 255);
% smooth_mapped_array = flip(smooth_mapped_array, 1);
% subplot(2, 1, 1)
% image(smooth_mapped_array);
% colormap(gray(255));
% 
% 
% % Cauculating and plotting HMH fig. 5.9: Cepstrum
% cepstrum_stack = zeros(fft_len, n_frames);
% for p = 1:n_frames
%     ceps = ifft(stft_log(:, p));
%     cepstrum_stack(:, p) = ceps;
% end
% ceps_real_stack = log(abs(real(cepstrum_stack)));
% ceps_real_stack = ceps_real_stack(30:320, :);
% smooth_maxv = median(ceps_real_stack);
% smooth_mapped_array = uint8((double(ceps_real_stack) ./ smooth_maxv) .* 255);
% smooth_mapped_array = flip(smooth_mapped_array, 1);
% subplot(2, 1, 2)
% image(smooth_mapped_array);
% % colormap(gray(255));
%  
% 
