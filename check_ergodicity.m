function check_ergodicity(ensemble, title_name)
Ts = 10e-3;
Number_of_Samples = size(ensemble, 2);

%% --- Ensemble statistics ---
plot_mean(ensemble, sprintf('%s — Ensemble Mean', title_name));
plot_autocorrelation(ensemble, sprintf('%s — Ensemble R_x(\\tau)', title_name));

ensemble_mean = mean(mean(ensemble, 1));

% Recompute Rx_ensemble here for numerical comparison below
t1  = Number_of_Samples / 2;
tau = -(Number_of_Samples/2 - 1) : (Number_of_Samples/2);
Rx_ensemble = zeros(1, length(tau));
for k = 1:length(tau)
    Rx_ensemble(k) = mean(ensemble(:, t1) .* ensemble(:, t1 + tau(k)));
end

%% --- Time statistics of one waveform ---
Mean_autocorrelation_OneWaveform(ensemble,sprintf('%s — Time R_x(\\tau)', title_name));

Waveform  = ensemble(1, :);
time_mean = mean(Waveform);
[Rx_time_full, ~] = xcorr(Waveform, 'unbiased');
center  = (length(Rx_time_full) + 1) / 2;
Rx_time = Rx_time_full(center + tau);

%% --- Verdict ---
mean_diff = abs(time_mean - ensemble_mean);
acf_diff  = mean(abs(Rx_ensemble - Rx_time)) / (mean(abs(Rx_ensemble)) + eps);

fprintf('\n=== %s ===\n', title_name);
fprintf('Ensemble mean          : %.4f\n', ensemble_mean);
fprintf('Time mean (1 waveform) : %.4f\n', time_mean);
fprintf('|Mean difference|      : %.4f\n', mean_diff);
fprintf('Relative ACF mismatch  : %.4f\n', acf_diff);

if mean_diff < 0.3 && acf_diff < 0.2
    fprintf('--> Process appears to be ERGODIC.\n');
else
    fprintf('--> Process does NOT appear to be ergodic.\n');
end
end