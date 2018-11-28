clear all; clc; close all;
SNRdB=0:0.1:20;
snr=10.^(SNRdB/10); 
% BPSK
BPSK = 0.5*erfc(sqrt(snr));
semilogy(SNRdB,BPSK);
hold on;
% DPSK
DPSK = 0.5*exp(-snr);
semilogy(SNRdB,DPSK);
hold on;
% QPSK
QPSK = 0.5*erfc(sqrt(snr));
semilogy(SNRdB,QPSK);
hold on;
% 16-QAM
k=4;
M=16;
x=sqrt(3*k*snr/(M-1));
QAM16 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));
semilogy(SNRdB, QAM16);
hold on;
% 64QAM
k=6;
M=64;
x=sqrt(3*k*snr/(M-1));
QAM64 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));
semilogy(SNRdB, QAM64);

%%%
ylim([10^-6 1]);
legend('BPSK','DPSK','QPSK','16-QAM','64-QAM');
ylabel('Probability of BER Error');
xlabel('Eb/N0 (dB)');
title('Probability of BER Error Vs Eb/N0');
grid on;