# Line Coding & Stochastic Analysis — MATLAB Project

A MATLAB simulation that generates ensembles of three line coding schemes and performs full stochastic characterization: statistical/time mean, autocorrelation, and Power Spectral Density (PSD) via the Wiener–Khinchin theorem.

---

## Schemes Implemented

| Scheme | Symbol Levels | Description |
|---|---|---|
| **Unipolar** | 0, +4 V | '1' → +4 V, '0' → 0 V, 8 samples/bit |
| **Polar NRZ** | ±4 V | '1' → +4 V, '0' → −4 V, no return to zero |
| **Polar RZ** | ±4 V, 0 | Same as NRZ but second half of each bit period forced to 0 V |

Each scheme generates an ensemble of **500 realizations × 800 samples**, with a **random initial phase shift** (0–7 samples) per realization to model a stationary random process.

---

## Analysis Performed

### 1. Waveform Visualization
Plots the first two realizations of each scheme side by side for visual inspection.

### 2. Statistical Mean
Computes the ensemble mean across all 500 realizations at each time sample:

$$\bar{x}(t) = \frac{1}{N} \sum_{i=1}^{N} x_i(t)$$

### 3. Time Mean
Computes the time-averaged mean of a single realization and overlays it on the waveform.

### 4. Statistical Autocorrelation
Fixes $t_1$ at the midpoint of the signal and sweeps $\tau$ across the full lag range:

$$R_x(\tau) = \mathbb{E}[x(t_1) \cdot x(t_1 + \tau)]$$

### 5. Time Autocorrelation
Uses MATLAB's `xcorr(..., 'unbiased')` on the first realization to estimate the time autocorrelation of a single waveform.

### 6. Power Spectral Density
Applies the **Wiener–Khinchin theorem** — takes the FFT of the statistical autocorrelation to compute and plot the two-sided PSD:

$$S_x(f) = \mathcal{F}\{R_x(\tau)\}$$

---

## File Structure

```
├── Project_1.m                   # Main script — runs all schemes & calls all functions
├── plot_waveform.m               # Plots first 2 realizations of an ensemble
├── plot_statmean.m               # Computes and plots ensemble (statistical) mean
├── plot_timemean.m               # Computes and plots time mean of one realization
├── plot_stat_autocorrelation.m   # Computes statistical autocorrelation R_x(τ)
├── plot_time_autocorrelation.m   # Computes time autocorrelation via xcorr
└── PSD.m                         # Computes PSD via Wiener–Khinchin (FFT of Rx)
```

> All helper functions are also embedded at the bottom of `Project_1.m` for standalone execution.

---

## Parameters

| Parameter | Value |
|---|---|
| Amplitude `a` | 4 V |
| Bits per realization | 100 (+ 1 guard bit) |
| Samples per bit | 8 |
| Sample period `Ts` | 10 ms |
| Sampling frequency `Fs` | 100 Hz |
| Bit period `Tb` | 80 ms |
| Ensemble size | 500 realizations |
| Samples per realization | 800 |

---

## How to Run

1. Open MATLAB and set the project folder as your working directory.
2. Run the main script:
```matlab
Project_1
```
All figures are generated automatically — waveforms, means, autocorrelations, and PSDs for all three schemes.

---

## Requirements

- MATLAB (R2019b or later recommended)
- Signal Processing Toolbox — for `xcorr()`

---

## Course Info

**Cairo University — Faculty of Engineering**  
Electronics & Electrical Communications Engineering Department  
Introduction to Communication systems - EECG 232
