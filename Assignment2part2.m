% 4.24
p0 = 10^-6;
d0 = 1000;
f = 1800*10^6; % Frequency in Hz 
c = 3*10.^8; % Speed of light in m/s 
pt = (p0*(4*pi).^2*d0.^2)./(gt*gr*lamda.^2); % Power transmitted 
gt = 1;% Gain of transmiter
gr = 1;% Gain of reciever 
ht= 40;% Height of transmitter 
hr = 3;% Height of reciever 
Er = 15;% Permittivity
lamda = c/f;
w= 0:1:20000;% Distance 
%Aproximate
d3 = 0:1:20000;
num1 = pt*gt*gr*(ht^2)*(hr^2);
denum1 = (d3).^4;
pr=num1./denum1;
pr_dbm6 = 10*log10(pr/10^-3);
%exact


%plot
figure(2);
plot(pr_dbm6);
hold on;
grid on;