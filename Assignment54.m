clear all; close all; clc;
SNRdB=0:0.1:20;
snr = 10.^(SNRdB/10);
Ts = 10.^-6;
B = 10.^6;
C = 1.5*B*log2(1+snr);
semilogy(SNRdB, C);
hold on;
Y = [0 0 6.8 8.6 10.5 12.6 14.8 17.0 19.4];
x = [0 1*10.^6 2*10.^6 3*10.^6 4*10.^6 5*10.^6 6*10.^6 7*10.^6 8*10.^6];
stairs(Y,x);
hold on;
xlim([0 20])
ylim([0 8*10.^6])
ylabel('Data Rate');
xlabel('Eb/N0 (dB)');
title('Data Rate Vs Eb/N0');
grid on;