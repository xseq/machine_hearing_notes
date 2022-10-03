% get crosscorrelation of two signals in the time domain
% Xuan Zhong, 01-18-2021

function [ccOut, peakLagIdx] = get_xcorr(x1In, x2In)
    % zero-pad the signals
    [lenX, ~] = size(x1In);
    zeroPadding = zeros(lenX, 1);
    x1 = [x1In; zeroPadding];
    x2 = [zeroPadding; x2In];

    % convert to frequency domain
    X1 = fft(x1);
    X2 = fft(x2);

    % calculate cross power spectral density and do ifft
    CC = X1 .* conj(X2);
    ccOut = ifft(CC);
    
    % give up the first element (no overlapping)
    ccOut = ccOut(2:end, 1);   
    
    % get peak index
    [~, peakRow] = max(ccOut);
    peakLagIdx = peakRow - lenX;
end
 