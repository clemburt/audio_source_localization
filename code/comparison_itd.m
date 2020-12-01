function [] = comparison_itd(liste_angles_given_l,liste_angles_given_r,liste_angles_given,kmax,audio,vitesse,distance,Fe,offset)

liste_angles_estimated = zeros(1,kmax);

for k=1:kmax
    [x1,fs1] = audioread(['KEMAR\full\elev0\L0e',liste_angles_given_l{k},'a.wav']);
    [x2,fs2] = audioread(['KEMAR\full\elev0\R0e',liste_angles_given_r{k},'a.wav']);
    left = conv(x1,audio,'same');
    right = conv(x2,audio,'same');
    liste_angles_estimated(k) = itd(left,right,vitesse,distance,Fe);
end

figure;
plot(liste_angles_given,liste_angles_estimated-offset);
hold on;
plot(liste_angles_given,liste_angles_given);
legend('results','y=x');
xlabel('azimuth_g_i_v_e_n');
ylabel('azimuth_e_t_i_m_a_t_e_d');
title('Comparison between azimuth given and azimuth estimated by ITD');

end

