function Mean_autocorrelation_OneWaveform(ensemble, title_name)
    Ts = 10e-3;
    Waveform  = ensemble(1, :);                  % pick the 1st realization
    time_mean = mean(Waveform);

    % xcorr with 'unbiased' gives an estimate of the time autocorrelation
    [Rx_time, lag_samples] = xcorr(Waveform, 'unbiased');

    figure;
    plot(lag_samples * Ts, Rx_time, 'LineWidth', 1.3);
    title(title_name);
    xlabel('\tau (s)');
    ylabel('R_x(\tau)');
    grid on;

    fprintf('%s — Time mean of one waveform: %.4f\n', title_name, time_mean);
end