p0 = 10^-6;
d0 = 1000;
x = 1000:1:20000;
d = 1000:1:20000;
f = 1800 * 10^6;
c = 3*10^8;
lamda = c/f;
ht = 40;
hr = 3;
gt = 1;
gr = 1;
%Free Space
pr(d) = p0*[(d0./d).^2];
pr_dbm(d) = 10*log10(pr(d)./10.^-3);
%%disp(pr_dbm(d));
%N=3
pr2(d) = p0*[(d0./d).^3];
pr_dbm2(d) = 10*log10(pr2(d)./10.^-3);

%N=4
pr3(d) = p0*[(d0./d).^4];
pr_dbm3(d) = 10*log10(pr3(d)./10.^-3);

%Two Ray
theta = ((2*pi)./lamda)*((2*ht*hr)./d);
pt = (p0*(4*pi).^2*d0.^2)./(gt*gr*lamda.^2);
num = (pt*gt*gr*(lamda.^2));
denum(d) = ((4*pi).^2)*(d.^2);
mult = 4*(sin(theta/2).^2);
pr_dbm4 =10*log10(((num./denum(d)).*mult)./10^-3);

%Hata model
% this is for A = a(ht) & Cm
A = 3.2 * log10(11.75*hr).^2 - 4.97;
Cm = 3;
L_50(d) = 46.3 +33.9*log10(f)-13.82*log10(ht)- A + (44.9 - 6.55*log10(ht))*log10(d) + Cm;
L1km_50 = 441.443;
pr_dbm5= (-30) - (L_50(d)-L1km_50);

%plot 4.23
figure(1);
semilogx(x,pr_dbm(d));
title ('Recieved power of different models');
ylabel('Pr(d) in dBm');
xlabel('d in km');
grid on;
hold on;
semilogx(x,pr_dbm2(d),':');
hold on;
semilogx(x,pr_dbm3(d),'--');
hold on
semilogx(x,pr_dbm4,'.');
hold on
semilogx(x,pr_dbm5,'+');
hold off;