function [azimuth] = ild(left_signal,right_signal,f)

ild = abs(abs(max(left_signal))-abs(max(right_signal)));
azimuth = asind(ild/(1.0+(f/1000)^0.8)); % arcsin en degrés

end