function plot_time_autocorrelation(ensemble, title_name)
    Ts = 10e-3;                          % sampling period [s]
    waveform = ensemble(1, :);           % pick the 1st realization
    N = length(waveform);
    
    tau_step = 5; 
    k_lags = 0 : tau_step : N-1;
    Rx_pos = zeros(1, length(k_lags));   % R_x for positive lags
    
    for idx = 1:length(k_lags)
        k = k_lags(idx);
        x1 = waveform(1     : N - k);
        x2 = waveform(1 + k : N    );
        Rx_pos(idx) = sum(x1 .* x2) / (N - k);
    end
    
    Rx_time     = [fliplr(Rx_pos(2:end)), Rx_pos];   
    lag_samples = [-fliplr(k_lags(2:end)), k_lags];  % matching lag axis
    
    figure;
    plot(lag_samples * Ts, Rx_time, '.-', 'LineWidth', 1.3, 'MarkerSize', 10);
    title(title_name);
    xlabel('\tau (s)');
    ylabel("< x(t) . x( t +\tau ) >");
    grid on;
    
    xlim([-0.5, 0.5]); 
end