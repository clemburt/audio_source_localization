p.Fs = 44100;     % Sampling rate (Hz)
p.dur = 4;        % Duration (seconds)
centerFreq =440;  % Center of band-pass filter (Hz)
width = 200;      % Width of band-pass filter (Hz)

% Time vector
t= linspace(0,p.dur,p.dur*p.Fs)';

% White noise
y = randn(size(t));

% Fourier Transform:
F = complex2real(fft(y),t);

% Band-pass filter in the frequency domain:
Gaussian = exp(-(F.freq-centerFreq).^2/width^2)';
plot(F.freq,Gaussian);
F.amp = F.amp.*Gaussian;

% Inverse Fourier Transform:
s = real(ifft(real2complex(F)))';

% Play the sound
sound(s,p.Fs);