function [azimuth] = itd(left_signal,right_signal,vitesse,distance,Fe)

[c,lags] = xcorr(right_signal,left_signal,'normalized');
[argvalue,argmax] = max(abs(c));
delay = lags(argmax)/Fe; % Between left and right (right = reference)
itd = vitesse*delay/distance;
azimuth = acosd(itd); % arccos en degrés

end
