clear all; clc; close all;
figure(1)
M = 2;
K1 = 10^(6/10);
DIVORDER = 1;
EbN0 = 0:0.1:50;
BER_Ray1 = berfading(EbN0,'psk',M,DIVORDER);
BER_Rician1 = berfading(EbN0,'psk',M,1,K1);
semilogy(EbN0, BER_Ray1);
hold on;
semilogy(EbN0, BER_Rician1);
hold on;
grid on;
ylim([10^-5 1]);
legend('Rayleigh Channel','Rician Channel');
xlabel('SNR (dB)');
ylabel('Bit Error Rate');
title('BPSK BER Vs SNR for K = 0 dB');

figure(2)
K2 = 10^(7/10);
DIVORDER = 1;
EbN0 = 0:0.1:50;
BER_Ray2 = berfading(EbN0,'psk',M,DIVORDER);
BER_Rician2 = berfading(EbN0,'psk',M,1,K2);
semilogy(EbN0, BER_Ray2);
hold on;
semilogy(EbN0, BER_Rician2);
hold on;
grid on;
ylim([10^-5 1]);
legend('Rayleigh Channel','Rician Channel');
xlabel('SNR (dB)');
ylabel('Bit Error Rate');
title('BPSK BER Vs SNR for K = 10 dB');