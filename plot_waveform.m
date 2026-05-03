function plot_waveform(ensemble, label, color, ylimits)
    t = 0:10:799*10;
    figure;
    subplot(1,2,1);
    plot(t, ensemble(1,:), color, 'LineWidth', 1.5);
    title([label ' - Waveform 1']);
    xlabel('Time (ms)'); ylabel('Amplitude');
    ylim(ylimits); grid on;
    xlim([0,2000]);

    subplot(1,2,2);
    plot(t, ensemble(2,:), color, 'LineWidth', 1.5);
    title([label ' - Waveform 2']);
    xlabel('Time (ms)'); ylabel('Amplitude');
    ylim(ylimits); grid on;
    xlim([0,2000]);

    sgtitle(['First 2 Waveforms - ' label]);
end