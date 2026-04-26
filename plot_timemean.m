function plot_timemean(ensemble, title_name)
    
    t = 0:10:799*10;
    single_realization = ensemble(1, :);   % extracting the first realization (first row) from our ensemble 
    
    % Average all the samples across time to find the time mean of this specific signal
    time_mean = sum(single_realization) / length(single_realization);
    
    figure;
    plot(t, single_realization, 'b', 'LineWidth', 1.3); hold on;
    yline(time_mean, 'r--', sprintf('Time Mean = %.3f', time_mean), 'LineWidth', 1.5);
    
    title(title_name);
    xlabel('Time (ms)');
    ylabel('Amplitude');
    grid on;
end