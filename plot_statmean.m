function plot_statmean(ensemble, title_name)
    statistical_mean = mean(ensemble, 1);   
    t = 0:10:799*10; 
    figure
    plot(t, statistical_mean);
    title(title_name);
    xlabel('Time (ms)');
    ylabel('Mean Amplitude');
    grid on;
end