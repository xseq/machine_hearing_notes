%% Cepstrum Analysis

%% What Is a Cepstrum?
% Cepstrum analysis is a nonlinear signal processing technique with a
% variety of applications in areas such as speech and image processing.
% 
% The _complex cepstrum_ of a sequence _x_ is calculated by finding the
% complex natural logarithm of the Fourier transform of _x_, then the
% inverse Fourier transform of the resulting sequence:
% 
% $$\hat x={1\over2\pi}\int_{-\pi}^\pi\log[X(e^{j\omega})]e^{j\omega
% n}\,d\omega.$$
% 
% The toolbox function |cceps| performs this operation, estimating the
% complex cepstrum for an input sequence. It returns a real sequence the
% same size as the input sequence.

%%
% Try using cceps in an echo detection application. First, create a 45 Hz
% sine wave sampled at 100 Hz. Add an echo of the signal, with half the
% amplitude, 0.2 seconds after the beginning of the signal.

t = 0:0.01:1.27;
s1 = sin(2*pi*45*t);
s2 = s1 + 0.5*[zeros(1,20) s1(1:108)];
figure
subplot(3, 1, 1)
plot(t, s1)
subplot(3, 1, 2)
plot(t, s2)

%%
% Compute and plot the complex cepstrum of the new signal.

c = cceps(s2);
subplot(3, 1, 3)
plot(t,c)

%%
% The complex cepstrum shows a peak at 0.2 seconds, indicating the echo.
%
% The _real cepstrum_ of a signal _x_, sometimes called simply the
% cepstrum, is calculated by determining the natural logarithm of magnitude
% of the Fourier transform of _x_, then obtaining the inverse Fourier
% transform of the resulting sequence:
%
% $$c_x={1\over2\pi}\int_{-\pi}^\pi\log\left|X(e^{j\omega})
% \right|e^{j\omega n}\,d\omega.$$
%
% The toolbox function |rceps| performs this operation, returning the real
% cepstrum for a sequence. The returned sequence is a real-valued vector
% the same size as the input vector.
%
% The |rceps| function also returns a unique minimum-phase sequence that
% has the same real cepstrum as the input. To obtain both the real cepstrum
% and the minimum-phase reconstruction for a sequence, use |[y,ym] =
% rceps(x)|, where |y| is the real cepstrum and |ym| is the minimum phase
% reconstruction of |x|. The following example shows that one output of
% |rceps| is a unique minimum-phase sequence with the same real cepstrum as
% |x|.

y = [4 1 5];                 % Non-minimum phase sequence
[xhat,yhat] = rceps(y);
xhat2 = rceps(yhat); 
[xhat' xhat2'] 

%% Inverse Complex Cepstrum
% To invert the complex cepstrum, use the |icceps| function. Inversion is
% complicated by the fact that the |cceps| function performs a
% data-dependent phase modification so that the unwrapped phase of its
% input is continuous at zero frequency. The phase modification is
% equivalent to an integer delay. This delay term is returned by |cceps| if
% you ask for a second output:

x = 1:10;
[xhat,delay] = cceps(x)

%%
% To invert the complex cepstrum, use |icceps| with the original delay
% parameter:

icc = icceps(xhat,2)

%%
% As shown in the above example, with any modification of the complex
% cepstrum, the original delay term may no longer be valid. You will not be
% able to invert the complex cepstrum exactly.
 