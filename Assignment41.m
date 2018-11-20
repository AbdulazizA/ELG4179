%For OOK
R = 5; %50Mb/s
T = 1/R; % in seconds
alpha = 1/2; % roll off factor
t = [-6:0.001:6];
h = t-T;
k = t+T;
% Raised Cosine pulse
if ( t == 0)
    p = 1;
else
    sincNum = sin(pi*t*R);
    sincDen = (pi*t*R);
    sincOp = sincNum./sincDen;
    cosNum = cos(pi*t*R*alpha);
    cosDen = (1-4*(alpha*t*R).^2);
    cosOp = cosNum./cosDen;
    p = sincOp.*cosOp;
end
% Unipolar (OOK) Pulse Train
if ( h == 0)
    p = 1;
else
    %t-T
    sincNum1 = sin(pi*h*R);
    sincDen1 = (pi*h*R);
    sincOp1 = sincNum1./sincDen1;
    cosNum1 = cos(pi*h*R*alpha);
    cosDen1 = (1-4*(alpha*h*R).^2);
    cosOp1 = cosNum1./cosDen1;
    %t+T
    sincNum2 = sin(pi*k*R);
    sincDen2 = (pi*k*R);
    sincOp2 = sincNum2./sincDen2;
    cosNum2 = cos(pi*k*R*alpha);
    cosDen2 = (1-4*(alpha*k*R).^2);
    cosOp2 = cosNum2./cosDen2;
    x = (sincOp1.*cosOp1)+(sincOp2.*cosOp2);
end
% Bipolar (BPSK) Pulse Train
if ( h == 0)
    p = 1;
else
    %t
    sincNum = sin(pi*t*R);
    sincDen = (pi*t*R);
    sincOp = sincNum./sincDen;
    cosNum = cos(pi*t*R*alpha);
    cosDen = (1-4*(alpha*t*R).^2);
    cosOp = cosNum./cosDen;
    %t-T
    sincNum1 = sin(pi*h*R);
    sincDen1 = (pi*h*R);
    sincOp1 = sincNum1./sincDen1;
    cosNum1 = cos(pi*h*R*alpha);
    cosDen1 = (1-4*(alpha*h*R).^2);
    cosOp1 = cosNum1./cosDen1;
    %t+T
    sincNum2 = sin(pi*k*R);
    sincDen2 = (pi*k*R);
    sincOp2 = sincNum2./sincDen2;
    cosNum2 = cos(pi*k*R*alpha);
    cosDen2 = (1-4*(alpha*k*R).^2);
    cosOp2 = cosNum2./cosDen2;
    z = (sincOp1.*cosOp1)+(sincOp2.*cosOp2)-(sincOp.*cosOp);
end
%Plot
figure(1);
plot(t,p);
hold on;
plot(t,x);
xlabel('Time is in 10^-6s');
ylabel('Amplitude');
grid on;
figure(2);
plot(t,p);
hold on;
plot(t,z);
xlabel('Time is in 10^-6s');
ylabel('Amplitude');
grid on;
