clear all; clc; close all;
SNRdB=0:0.1:20;
snr=10.^(SNRdB/10); 
% BPSK
BPSK = 0.5*erfc(sqrt(snr));

% 4-QAM
k=2;
M=4;
x=sqrt(3*k*snr/(M-1));
QAM4 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));

% 8-QAM
k=3;
M=8;
x=sqrt(3*k*snr/(M-1));
QAM8 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));

% 16-QAM
k=4;
M=16;
x=sqrt(3*k*snr/(M-1));
QAM16 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));

% 32-QAM
k=5;
M=32;
x=sqrt(3*k*snr/(M-1));
QAM32 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));

% 64-QAM
k=6;
M=64;
x=sqrt(3*k*snr/(M-1));
QAM64 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));

% 128-QAM
k=7;
M=128;
x=sqrt(3*k*snr/(M-1));
QAM128 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));

% 256-QAM
k=8;
M=256;
x=sqrt(3*k*snr/(M-1));
QAM256 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));

% 512-QAM
k=9;
M=512;
x=sqrt(3*k*snr/(M-1));
QAM512 =(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));
semilogy(SNRdB, QAM512);
hold on;

%Plot
figure(1)
semilogy(SNRdB,BPSK);
hold on;
semilogy(SNRdB, QAM4);
hold on;
semilogy(SNRdB, QAM8);
hold on;
semilogy(SNRdB, QAM16);
hold on;
semilogy(SNRdB, QAM32);
hold on;
semilogy(SNRdB, QAM64);
hold on;
semilogy(SNRdB, QAM128);
hold on;
semilogy(SNRdB, QAM256);
hold on;
semilogy(SNRdB, QAM512);
hold on;
ylim([10^-6 1]);
legend('BPSK','4-QAM','8-QAM','16-QAM','32-QAM','64-QAM','128-QAM','256-QAM','512-QAM');
ylabel('Probability of BER Error');
xlabel('Eb/N0 (dB)');
title('Probability of BER Error Vs Eb/N0');
grid on;
