function Rx_ensemble = plot_stat_autocorrelation(ensemble, title_name, plotflag)
    Ts = 10e-3; 
    Number_of_Samples = size(ensemble, 2);
    num_realizations = size(ensemble, 1); % The number of rows represents total realizations
    
    % We fix one time point (t1) in the middle of our sample range to compare against
    t1 = floor(Number_of_Samples / 2);
    
    tau_step = 5; 
    
    % Create an array of time shifts to sweep through
    tau = -(t1 - 1) : tau_step : t1;
    Rx_ensemble = zeros(1, length(tau)); 
   
    for k = 1:length(tau)
        t2 = t1 + tau(k);
        product = ensemble(:, t1) .* ensemble(:, t2);
        Rx_ensemble(k) = sum(product) / num_realizations;  % Average the products to get the statistical autocorrelation for this specific tau
    end
    
    % Generate the plot only if the plotflag is true which happens in the
    % main code only
    if plotflag
        figure;
        plot(tau * Ts, Rx_ensemble, '.-', 'LineWidth', 1.3, 'MarkerSize', 10);
        title(title_name);
        xlabel('\tau (s)');
        ylabel('R_x(\tau)');
        grid on;
        
        xlim([-0.5, 0.5]); 
    end
end