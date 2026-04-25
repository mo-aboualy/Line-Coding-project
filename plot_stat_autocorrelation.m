function Rx_ensemble = plot_stat_autocorrelation(ensemble, title_name, plotflag)
    Ts = 10e-3;
    Number_of_Samples = size(ensemble, 2);
    t1 = Number_of_Samples / 2;
    tau = -(Number_of_Samples/2 - 1) : (Number_of_Samples/2);
    Rx_ensemble = zeros(1, length(tau));
    num_realizations = size(ensemble, 1);
    
    for k = 1:length(tau)
        t2 = t1 + tau(k);
        product = ensemble(:, t1) .* ensemble(:, t2);
        Rx_ensemble(k) = sum(product) / num_realizations;
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