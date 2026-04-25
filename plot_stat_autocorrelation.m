function Rx_ensemble = plot_stat_autocorrelation(ensemble, title_name,plotflag)
Ts = 10e-3;                               % sample period = 10 ms
Number_of_Samples = size(ensemble, 2);    % 800 time samples
t1 = Number_of_Samples / 2;               % fix t1 at the middle (scalar)
tau = -(Number_of_Samples/2 - 1) : (Number_of_Samples/2);  

Rx_ensemble = zeros(1, length(tau));
for k = 1:length(tau)
    t2 = t1 + tau(k);
    Rx_ensemble(k) = mean(ensemble(:, t1) .* ensemble(:, t2));
end
if plotflag
figure;
plot(tau * Ts, Rx_ensemble, 'LineWidth', 1.3);
title(title_name);
xlabel('\tau (s)');
ylabel('R_x(\tau)');
grid on;
end
end