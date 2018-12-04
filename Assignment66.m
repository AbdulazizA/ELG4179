clear all; clc; close all;
figure(1)
M = 2;
DIVORDER = 1;
EbN0 = -5:0.1:50;
BER_Ray = berfading(EbN0,'psk',M,DIVORDER);
semilogy(EbN0, BER_Ray);
hold on;
BER_awgn = berawgn(EbN0,'psk',M,'nondiff');
semilogy(EbN0, BER_awgn);
grid on;
ylim([10^-5 1]);
xlim([-5 50]);
legend('Rayleigh Channel', 'BPSK AWGN Channel');
xlabel('SNR (dB)');
ylabel('Bit Error Rate');
title('BPSK BER Vs SNR');