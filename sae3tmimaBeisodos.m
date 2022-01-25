function u=sae3tmimaBeisodos(q1,q2,q1_dot,q2_dot,t)
%Prosegkistikes Times Systymatos
m1=6;
m2p=2;
L1p=0.5;
L2=0.4;
Lc1p=0.35;
Lc2p=0.1;
Iz1p=0.05;
Iz2p=0.02;
g=9.81;
%Orismos Newn pinakwn
Hp=[m2p*(Lc2p^2 + 2*L1p*Lc2p*cos(q2)+ L1p^2)+(Lc1p^2)*m1+Iz2p+Iz1p m2p*Lc2p^2+L1p*Lc2p*m2p*cos(q2)+Iz2p; (Lc2p^2)*m2p+L1p*Lc2p*m2p*cos(q2)+Iz2p m2p*(Lc2p^2)+Iz2p];
Cp=[-m2p*L1p*Lc2p*sin(q2)*q2_dot -m2p*L1p*Lc2p*sin(q2)*(q2_dot+q1_dot); m2p*L1p*Lc2p*sin(q2)*q1_dot 0];
Gp=[m2p*Lc2p*g*cos(q1+q2)+(m2p*L1p+m1*Lc1p)*g*cos(q1); m2p*Lc2p*g*cos(q1+q2)];
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
%Orismos qr qr_dot qr_2dot
qr1_dot=q1d_dot-10*(q1-q1d);
qr2_dot=q2d_dot-10*(q2-q2d);
qr1_2dot=q1d_dot2-10*(q1_dot-q1d_dot);
qr2_2dot=q2d_dot2-10*(q2_dot-q2d_dot);
%Orismos s1 s2
s1=q1_dot-qr1_dot;
s2=q2_dot-qr2_dot; 
% Times systymatos again
m1b =6;
L1b = 0.5;
gb=9.81;
%Orismos Y kai theta
Y1=[-L1b*sin(q2)*q2_dot*qr1_dot-L1b*sin(q2)*(q2_dot+q1_dot)*qr2_dot+gb*cos(q1+q2) L1b*gb*cos(q1) m1b*gb*cos(q1); L1b*sin(q2)*q1_dot*qr1_dot+gb*cos(q1+q2) 0 0];
Y2=[qr1_2dot*(L1b^2) qr1_2dot+qr2_2dot cos(q2)*qr2_2dot*L1b+qr1_2dot*2*L1b*cos(q2) qr1_dot*m1b qr1_2dot qr1_2dot+qr2_2dot; 0 qr1_2dot+qr2_2dot qr1_2dot*L1b*cos(q2) 0 0 qr1_2dot+qr2_2dot];
Dtheta1_anw=[2.05; 3; 0.25];
Dtheta2_anw=[3; 0.9925; 2.05; 0.1125; 0.45; 0.13];
n=[0.04; 0.05];
%Orismos synartisis prosimou
signS1=SmoothSign(s1,1);
signS2=SmoothSign(s2,1);
%Orismos (k)
k1=abs(Y1(1,1))*Dtheta1_anw(1,1)+abs(Y1(1,2))*Dtheta1_anw(2,1)+abs(Y1(1,3))*Dtheta1_anw(3,1)+abs(Y2(1,1))*Dtheta2_anw(1,1)+abs(Y2(1,2))*Dtheta2_anw(2,1)+abs(Y2(1,3))*Dtheta2_anw(3,1)+abs(Y2(1,4))*Dtheta2_anw(4,1)+abs(Y2(1,5))*Dtheta2_anw(5,1)+abs(Y2(1,6))*Dtheta2_anw(6,1)+n(1,1);
k2=abs(Y1(2,1))*Dtheta1_anw(1,1)+abs(Y1(2,2))*Dtheta1_anw(2,1)+abs(Y1(2,3))*Dtheta1_anw(3,1)+abs(Y2(2,1))*Dtheta2_anw(1,1)+abs(Y2(2,2))*Dtheta2_anw(2,1)+abs(Y2(2,3))*Dtheta2_anw(3,1)+abs(Y2(2,4))*Dtheta2_anw(4,1)+abs(Y2(2,5))*Dtheta2_anw(5,1)+abs(Y2(2,6))*Dtheta2_anw(6,1)+n(2,1);
%Orismos eisodou (u)
u1=Hp(1,1)*qr1_2dot+Hp(1,2)*qr2_2dot+Cp(1,1)*qr1_dot+Cp(1,2)*qr2_dot+Gp(1,1)-k1*signS1;
u2=Hp(2,1)*qr1_2dot+Hp(2,2)*qr2_2dot+Cp(2,1)*qr1_dot+Cp(2,2)*qr2_dot+Gp(2,1)-k2*signS2;
u = [u1; u2];
end