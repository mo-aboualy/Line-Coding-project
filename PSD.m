function PSD_result = PSD(ensemble, title_name)
    Ts = 10e-3;
    Fs = 1 / Ts;
    Tb = 8 * Ts;

    %% --- Get autocorrelation from previous function ---
    Rx_ensemble = plot_stat_autocorrelation(ensemble, sprintf('%s — R_x(\\tau)', title_name),false);

    %% --- PSD via Wiener–Khinchin ---
    Nfft = 2^nextpow2(length(Rx_ensemble));
    PSD_result = abs(fftshift(fft(Rx_ensemble, Nfft)));
    f = (-Nfft/2 : Nfft/2 - 1) * (Fs / Nfft);

    %% --- Plot PSD ---
    figure;
    plot(f, PSD_result, 'LineWidth', 1.3); grid on;
    title(sprintf('%s — Power Spectral Density', title_name));
    xlabel('Frequency (Hz)'); ylabel('|S_x(f)|');
    xlim([-3/Tb, 3/Tb]);
end