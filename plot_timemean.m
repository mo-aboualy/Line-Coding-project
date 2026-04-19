function plot_timemean(ensemble, title_name)
    t = 0:10:799*10;
    single_realization = ensemble(1, :);        
    time_mean = mean(single_realization);         
    figure;
    plot(t, single_realization, 'b', 'LineWidth', 1.3); hold on;
    yline(time_mean, 'r--', sprintf('Time Mean = %.3f', time_mean), 'LineWidth', 1.5);
    title(title_name);
    xlabel('Time (ms)');
    ylabel('Amplitude');
    grid on;
end