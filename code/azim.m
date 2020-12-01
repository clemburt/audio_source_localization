function [data] = azim(left_signal,right_signal,vitesse,distance,Fe,angle,f)

[data.c,data.lags] = xcorr(right_signal,left_signal,'normalized');
[data.argvalue,data.argmax] = max(abs(data.c));
data.delay_corr = data.lags(data.argmax)/Fe; % Between left and right (right = reference)
data.delay_find = finddelay(left_signal,right_signal)/Fe;
data.itd_corr = vitesse*data.delay_corr/distance;
data.itd_find = vitesse*data.delay_find/distance;
data.ild = abs(abs(max(left_signal))-abs(max(right_signal)));
data.azimuth_itd_corr = acosd(data.itd_corr); % arccos en degrés
data.azimuth_itd_find = acosd(data.itd_find);
data.azimuth_ild = asind(data.ild/(1.0+(f/1000)^0.8)); % arcsin en degrés
% We expect theta = 270/2 = 135

figure;
% xlabel('');
subplot(2,1,1);
plot(left_signal);
hold on;
plot(right_signal);
legend('left ear','right ear');
xlabel('time (ms)');
title(['Left and right signals for elev = 0°, azimuth = ',angle,'°']);
subplot(2,1,2);
stem(data.lags,data.c); % Inter-corrélation
title('Intercorrelation between left and right signals');

end

