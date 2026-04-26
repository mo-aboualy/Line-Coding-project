function plot_time_autocorrelation(ensemble, title_name)
    Ts = 10e-3;                          % sampling period [s]
    waveform = ensemble(1, :);           % pick the 1st realization
    N = length(waveform);
    Rx_pos = zeros(1, N);                % R_x for k = 0, 1, ..., N-1

    for k = 0 : N-1
        x1 = waveform(1     : N - k);
        x2 = waveform(1 + k : N    );
        Rx_pos(k + 1) = sum(x1 .* x2) / (N - k);
    end
    
    Rx_time     = [fliplr(Rx_pos(2:end)), Rx_pos];   % length 2N-1
    lag_samples = -(N-1) : (N-1);                    % matching lag axis

    figure;
    plot(lag_samples * Ts, Rx_time, 'LineWidth', 1.3);
    title(title_name);
    xlabel('\tau (s)');
    ylabel("< x(t) . x( t +\tau ) >");
    grid on;
end