clear all; clc; close all;
SNRdB=0:0.1:20;
snr=10.^(SNRdB/10);
B = 10.^6;
Ts = 10.^-6;
Yth = 10.^-3;
% M-QAM
for k = 2:1:9;
    M = 2.^k;
    x=sqrt(3.*k.*snr/(M-1));
    QAM=(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));
    QAM_O(k,:)=[QAM];
end
% BER of Adaptive Modulation
P_e = max(QAM_O.*(QAM_O < Yth));
semilogy(SNRdB,P_e);
ylabel('BER of Adaptive Modulation');
xlabel('Eb/N0 (dB)');
title('BER of Adaptive Modulation Vs SNR');
grid on;