function [azimuth] = compute_IPD(left_signal,right_signal,vitesse,distance,Fe,angle)

[c,lags] = xcorr(left_signal,right_signal);
[argvalue, argmax] = max(abs(c));
azimuth = acosd(lags(argmax)/Fe*vitesse/distance); % arccos en degrés
% We expect theta = 270/2 = 135

figure;
% xlabel('');
subplot(2,1,1);
plot(left_signal);
hold on;
plot(right_signal);
legend('left ear','right ear');
title(['Left and right signals phases for elev = 0, azimuth = ',angle]);
subplot(2,1,2);
stem(lags,c); % Inter-corrélation
title('Intercorrelation between signal1 and signal2');

end

