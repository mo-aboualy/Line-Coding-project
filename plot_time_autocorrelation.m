function plot_time_autocorrelation(ensemble, title_name)
    Ts = 10e-3;
    Waveform  = ensemble(1, :);                  % pick the 1st realization
  
    % xcorr with 'unbiased' gives an estimate of the time autocorrelation
    [Rx_time, lag_samples] = xcorr(Waveform, 'unbiased');

    figure;
    plot(lag_samples * Ts, Rx_time, 'LineWidth', 1.3);
    title(title_name);
    xlabel('\tau (s)');
    ylabel('< x(t) . x(t + \tau) >');
    grid on;
end