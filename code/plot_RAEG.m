function [] = plot_RAEG(distance,vitesse)

theta_rad = 0:0.1*pi/180:pi;
theta_deg = 0:0.1:180;
delay_aeg = distance/vitesse*cos(theta_rad);
delay_raeg = distance/(2*vitesse)*(pi/2-theta_rad+cos(theta_rad));
figure;
plot(theta_deg,delay_aeg);
hold on;
plot(theta_deg,delay_raeg);
legend('theta_a_e_g','theta_r_a_e_g');
xlabel('theta(deg)');
ylabel('delay(s)');
title('Comparaison AEG/RAEG');

end