function dxdt=sae3timaBrhs(t,x)

% Times systymatos
m1 =6;
m2 =4;
L1 = 0.5;
L2 =0.4;
Lc1 = 0.2;
Lc2 = 0.4;
Iz1 =0.43;
Iz2 = 0.05;
g=9.81;
% Orismos Arxikwn pinakwn
H=[m2*(Lc2^2 + 2*L1*Lc2*cos(x(2))+ L1^2)+(Lc1^2)*m1+Iz2+Iz1 m2*Lc2^2+L1*Lc2*m2*cos(x(2))+Iz2; (Lc2^2)*m2+L1*Lc2*m2*cos(x(2))+Iz2 m2*(Lc2^2)+Iz2];
C=[-m2*L1*Lc2*sin(x(2))*x(4) -m2*L1*Lc2*sin(x(2))*(x(4)+x(3)); m2*L1*Lc2*sin(x(2))*x(3) 0];
G=[m2*Lc2*g*cos(x(1)+x(2))+(m2*L1+m1*Lc1)*g*cos(x(1)); m2*Lc2*g*cos(x(1)+x(2))];
Hinv=inv(H);
%Orismos qd kai twn paragwgwn ths
if t<=5
    q1d=-90 +50*(1-cos(0.63*t));
    q1d_dot=31.5*sin(0.63*t);
    q1d_dot2=19.845*cos(0.63*t);
else
    q1d=10;
    q1d_dot=0;
    q1d_dot2=0;
end

if t<=5
    q2d=170 -60*(1-cos(0.63*t));
    q2d_dot=-37.8*sin(0.63*t);
    q2d_dot2= -23.814*cos(0.63*t);
else
    q2d=50;
    q2d_dot=0;
    q2d_dot2=0;
end
%Orismos eisodwn
%Orismos (v)
v1=q1d_dot2 -20*x(3) +20*q1d_dot -100*x(1) + 100*q1d;
v2=q2d_dot2 -20*x(4) +20*q2d_dot -100*x(2) + 100*q2d;
%Orismos (u)
u1=H(1,1)*v1+H(1,2)*v2+C(1,1)*x(3)+C(1,2)*x(4)+G(1,1);
u2=H(2,1)*v1+H(2,2)*v2+C(2,1)*x(3)+C(2,2)*x(4)+G(2,1);

%Orismos Paragwgwn
dxdt_1=x(3);
dxdt_2=x(4);
dxdt_3=Hinv(1,1)*(u1-C(1,1)*x(3)-C(1,2)*x(4)-G(1,1))+Hinv(1,2)*(u2-C(2,1)*x(3)-C(2,2)*x(4)-G(2,1));
dxdt_4=Hinv(2,1)*(u1-C(1,1)*x(3)-C(1,2)*x(4)-G(1,1))+Hinv(2,2)*(u2-C(2,1)*x(3)-C(2,2)*x(4)-G(2,1));

dxdt=[dxdt_1; dxdt_2; dxdt_3; dxdt_4];
end


