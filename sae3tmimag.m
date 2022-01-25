function dxdtb2=sae3tmimag(t,x)

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
u=sae3tmimaBeisodos(x(1),x(2),x(3),x(4),t);
%Orismos Paragwgwn
dxdt_1=x(3);
dxdt_2=x(4);
dxdt_3=Hinv(1,1)*(u(1,1)-C(1,1)*x(3)-C(1,2)*x(4)-G(1,1))+Hinv(1,2)*(u(2,1)-C(2,1)*x(3)-C(2,2)*x(4)-G(2,1));
dxdt_4=Hinv(2,1)*(u(1,1)-C(1,1)*x(3)-C(1,2)*x(4)-G(1,1))+Hinv(2,2)*(u(2,1)-C(2,1)*x(3)-C(2,2)*x(4)-G(2,1));

dxdtb2=[dxdt_1; dxdt_2; dxdt_3; dxdt_4];
end