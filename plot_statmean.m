function plot_statmean(ensemble, title_name)
    [num_realizations, ~] = size(ensemble);
    
    % Average across all realizations (rows) for each specific time step (columns)
    statistical_mean = sum(ensemble, 1) / num_realizations;

    t = 0:10:799*10;  % Create a time vector for the x-axis 
    figure;
    plot(t, statistical_mean, 'LineWidth', 1.3); 
    title(title_name);
    xlabel('Time (ms)');
    ylabel('Mean Amplitude');
    grid on;
end